#!/bin/bash

# Here you need to specify these parameters
readonly AZURE_ACCT="rifujita" 
readonly RES_LOC="japaneast"
readonly RES_GRP="${AZURE_ACCT}mcrg"
readonly VM_SIZE="Standard_D4s_v3"
readonly VM_NAME="${RES_GRP}vm"
readonly RCON_PASSWORD="testpass"

# Checking if Resource Group exists
echo "Checking Resource Group..."
res=$(az group show -g $RES_GRP -o tsv --query "properties.provisioningState" 2>&1)
if [ "${res:0:5}" != "ERROR" ]; then
	echo "The Resource Group, ${RES_GRP} has already existed."
	exit
fi

# Create Resource Group
echo "Creating Resource Group..."
res=$(az group create -l $RES_LOC -g $RES_GRP -o tsv --query "properties.provisioningState")
if [ "$res" != "Succeeded" ]; then
	az group delete --yes --no-wait -g $RES_GRP
	exit
fi

# Create VM
echo "Creating VM..."
echo "Please wait for about 5 minutes to complete..."
res=$(az vm create --image Canonical:UbuntuServer:18.04-LTS:latest --size ${VM_SIZE} -g ${RES_GRP} -n ${VM_NAME} \
	--os-disk-size-gb 256 --storage-sku Premium_LRS --public-ip-address-dns-name ${VM_NAME} -o tsv --query "powerState")
if [ "$res" != "VM running" ]; then
	az group delete --yes --no-wait -g $RES_GRP
	exit
fi

echo "Installing docker..."
sleep 30
ssh-keygen -R "${VM_NAME}.${RES_LOC}.cloudapp.azure.com"
ssh -o "StrictHostKeyChecking no" ${AZURE_ACCT}@"${VM_NAME}.${RES_LOC}.cloudapp.azure.com" <<-'EOF'

# On Remote
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common pwgen apache2-utils

curl -fsSL -o /tmp/gpg https://download.docker.com/linux/ubuntu/gpg
sudo apt-key add /tmp/gpg
rm -f /tmp/gpg

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get -y update
sudo apt-get -y install docker-ce

sudo usermod -aG docker $USER

sudo systemctl enable docker --now
EOF

echo "Starting container..."
ssh -t -o "StrictHostKeyChecking no" ${AZURE_ACCT}@"${VM_NAME}.${RES_LOC}.cloudapp.azure.com" "RCON_PASSWORD=$(printf %q "$RCON_PASSWORD") \
	sudo docker run -itd --restart=always \
	-e EULA=true -e ENABLE_RCON=true -e RCON_PASSWORD=$RCON_PASSWORD \
	-p 25565:25565 -p 25575:25575 \
	-v /var/opt/minecraft/data:/data rioriost/minecraft-server"

# Open Ports
echo "Opening ports..."
res=$(az vm open-port -g $RES_GRP -n $VM_NAME --port 25565 --priority 910 -o tsv --query provisioningState)
if [ "$res" != "Succeeded" ]; then
	echo "Please open port 25565 manually."
fi
res=$(az vm open-port -g $RES_GRP -n $VM_NAME --port 25575 --priority 911 -o tsv --query provisioningState)
if [ "$res" != "Succeeded" ]; then
	echo "Please open port 25575 manually."
fi

cat << EOF | tee minecraft_vm_settings.txt

Your Minecraft Server has been successfully created!
	${VM_NAME}.${RES_LOC}.cloudapp.azure.com

Command to stop the service:
az vm deallocate -g ${RES_GRP} -n ${VM_NAME} --no-wait

Command to start the service again:
az vm start -g ${RES_GRP} -n ${VM_NAME}

Command to delete all the data:
az group delete --yes --no-wait -g ${RES_GRP}

Please consider to use Azure Automation to schedule VM start/stop.
https://docs.microsoft.com/ja-jp/azure/automation/automation-solution-vm-management

ENJOY!!

EOF
