# deploy_minecraft

This simple script, create_minecraft.sh deploys a minecraft server as a container to ACI, Azure Container Instances, enabled to be connected remotely with MCRCON.
Only what you need to do is changing 6 readonly parameters in the beggining of the script.

Before deploying a container, you must install Azure CLI (https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli?view=azure-cli-latest) and subscribe to Azure.

If you have subscribed to Azure, it's the easiest to run the script on Cloud Shell from Azure Portal.

Dockerfile
https://github.com/rioriost/dockerfiles/tree/master/minecraft-server

Docker image
https://cloud.docker.com/u/rioriost/repository/docker/rioriost/minecraft-server

If you want to play with lots of your friends, please consider to use 'create_minecraft_vm.sh' to deploy a VM. ACI has limited vCPU and memory. e.g. 2vCPU and 8GB mem in Japan East region. You can use more powerful VM than ACI.
