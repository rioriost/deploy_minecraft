# deploy_minecraft

Dit eenvoudige script, create_minecraft. sh implementeert een minecraft-server als een container naar ACI, Azure container instances, ingeschakeld om te worden aangesloten op afstand met MCRCON. Alleen wat u hoeft te doen is het wijzigen van 6 ReadOnly parameters in het begin van het script.

Voordat u een container implementeert, moet u Azure CLI (https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli?view=azure-cli-latest) installeren en abonneren op Azure.

Als u zich hebt geabonneerd op Azure, is het het gemakkelijkst om uit te voeren van het script op Cloud shell vanuit Azure Portal.

Dockerfile https://github.com/rioriost/dockerfiles/tree/master/minecraft-server

Docker-installatiekopie https://cloud.docker.com/u/rioriost/repository/docker/rioriost/minecraft-server

Als u met veel van uw vrienden wilt spelen, overweeg dan om ' create_minecraft_vm. sh ' te gebruiken om een VM te implementeren. ACI heeft beperkte vCPU en geheugen. bijvoorbeeld 2vCPU en 8GB mem in Japan-Oost regio. U krachtiger VM dan ACI gebruiken.
