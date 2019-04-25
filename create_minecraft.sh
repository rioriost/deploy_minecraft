#!/bin/bash

# Here you need to specify these parameters
readonly AZURE_ACCT="rifujita" 
readonly ACI_RES_LOC="japaneast"
readonly ACI_RES_GRP="${AZURE_ACCT}democraft"
readonly ACI_STR_SH_NAME="acishare"
readonly RCON_PASSWORD="testing"
readonly ACI_CNT_NAME="${ACI_RES_GRP}-container"

ACI_STR_AN_CAND="${ACI_RES_GRP}$(uuidgen)"
ACI_STR_AN_CAND=$(echo $ACI_STR_AN_CAND | tr [A-Z] [a-z] | sed 's/\-//g')
readonly ACI_STR_AN=${ACI_STR_AN_CAND:0:24}

# Create Resource Group
echo "Creating Resource Group..."
res=$(az group create -l $ACI_RES_LOC -g $ACI_RES_GRP -o tsv --query "properties.provisioningState")
if [ "$res" != "Succeeded" ]; then
	exit
fi

# Create the storage account with the parameters
echo "Creating Storage Account..."
res=$(az storage account create -g $ACI_RES_GRP -n $ACI_STR_AN -l $ACI_RES_LOC --sku Standard_LRS -o tsv --query "provisioningState")
if [ "$res" != "Succeeded" ]; then
	az group delete --yes --no-wait -g $ACI_RES_GRP
	exit
fi

# Create the file share
echo "Creating Storage Share..."
res=$(az storage share create -n $ACI_STR_SH_NAME --account-name $ACI_STR_AN -o tsv --query "created")
if [ "$res" != "true" ]; then
	az group delete --yes --no-wait -g $ACI_RES_GRP
	exit
fi
STORAGE_KEY=$(az storage account keys list -g $ACI_RES_GRP --account-name $ACI_STR_AN --query "[0].value" -o tsv) 

# Create the container
echo "Creating Container..."
res=$(az container create --image itzg/minecraft-server -g $ACI_RES_GRP -n $ACI_CNT_NAME \
	--ip-address Public --ports 25565 25575 \
	--cpu 2 --memory 8 \
	-e EULA=TRUE ENABLE_RCON=true \
	RCON_PASSWORD=$RCON_PASSWORD \
	--azure-file-volume-account-name $ACI_STR_AN \
	--azure-file-volume-account-key $STORAGE_KEY \
	--azure-file-volume-share-name $ACI_STR_SH_NAME \
	--azure-file-volume-mount-path /data/ \
	-o tsv --query "provisioningState")
if [ "$res" != "Succeeded" ]; then
	az group delete --yes --no-wait -g $ACI_RES_GRP
	exit
fi
ipaddress=$(az container show -g $ACI_RES_GRP -n $ACI_CNT_NAME -o tsv --query "ipAddress.ip")

echo << EOF
Your Minecraft Container (${ipaddress}) has been successfully created!

Command to stop the container:
az container delete -g $ACI_RES_GRP -n $ACI_CNT_NAME

Command to redeploy the container and how to know the IP Address:
az container create --image itzg/minecraft-server -g $ACI_RES_GRP -n $ACI_CNT_NAME \
	--ip-address Public --ports 25565 25575 \
	--cpu 2 --memory 8 \
	-e ENABLE_RCON=true \
	RCON_PASSWORD=$RCON_PASSWORD \
	--azure-file-volume-account-name $ACI_STR_AN \
	--azure-file-volume-account-key $STORAGE_KEY \
	--azure-file-volume-share-name $ACI_STR_SH_NAME \
	--azure-file-volume-mount-path /data/
echo $(az container show -g $ACI_RES_GRP -n $ACI_CNT_NAME -o tsv --query "ipAddress.ip")

Command to delete all the data:
az group delete --yes --no-wait -g $ACI_RES_GRP
EOF
