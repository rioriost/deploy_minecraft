• deploy_minecraft

Dieses einfache Skript create_minecraft.sh stellt einen Minecraft-Server als Container für ACI bereit, Azure Container Instances, der für die Remoteverbindung mit MCRCON aktiviert ist. Nur was Sie tun müssen, ist 6 schreibgeschützte Parameter am Anfang des Skripts zu ändern.

Bevor Sie einen Container bereitstellen, müssen Sie Azure CLI (https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli?view=azure-cli-latest) installieren und Azure abonnieren.

Wenn Sie Azure abonniert haben, ist es am einfachsten, das Skript in Cloud Shell über Azure Portal auszuführen.

Dockerfile https://github.com/rioriost/dockerfiles/tree/master/minecraft-server

Docker-Image https://cloud.docker.com/u/rioriost/repository/docker/rioriost/minecraft-server

Wenn du mit vielen deinen Freunden spielen möchtest, solltest du 'create_minecraft_vm.sh' verwenden, um eine VM bereitzustellen. ACI verfügt über eingeschränkte vCPU und Arbeitsspeicher. z.B. 2vCPU und 8GB mem in Japan Ost Region. Sie können leistungsfähigere VM als ACI verwenden.
