# deploy_minecraft

This simple script deploys a minecraft server as a container to ACI, Azure Container Instances, enabled to be connected remotely with MCRCON.
Only what you need to do is changing 6 readonly parameters in the beggining of the script.

Before deploying a container, you must install Azure CLI (https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli?view=azure-cli-latest) and subscribe to Azure.

Dockerfile
https://github.com/rioriost/dockerfiles/tree/master/minecraft-server

Docker image
https://cloud.docker.com/u/rioriost/repository/docker/rioriost/minecraft-server
