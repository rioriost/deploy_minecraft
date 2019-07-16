• deploy_minecraft

Este script simple, create_minecraft.sh implementa un servidor minecraft como un contenedor en ACI, Azure Container Instances, habilitado para conectarse de forma remota con MCRCON. Sólo lo que necesita hacer es cambiar 6 parámetros de solo lectura al principio del script.

Antes de implementar un contenedor, debe instalar la CLI de Azure (https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli?view=azure-cli-latest) y suscribirse a Azure.

Si se ha suscrito a Azure, es el más fácil ejecutar el script en Cloud Shell desde Azure Portal.

Dockerfile https://github.com/rioriost/dockerfiles/tree/master/minecraft-server

Imagen de Docker https://cloud.docker.com/u/rioriost/repository/docker/rioriost/minecraft-server

Si quieres jugar con muchos de tus amigos, considera usar 'create_minecraft_vm.sh' para implementar una máquina virtual. ACI tiene vCPU y memoria limitadas. por ejemplo, 2vCPU y 8GB mem en la región Este de Japón. Puede usar una máquina virtual más eficaz que ACI.
