# deploy_minecraft

Este script simples, create_minecraft. sh implanta um servidor Minecraft como um contêiner para ACI, instâncias de contêiner do Azure, habilitado para ser conectado remotamente com MCRCON. Somente o que você precisa fazer é alterar 6 parâmetros ReadOnly no início do script.

Antes de implantar um contêiner, você deve instalar a CLI do Azure (https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli?view=azure-cli-latest) e assinar o Azure.

Se você se inscreveu no Azure, é mais fácil executar o script no Cloud Shell a partir do portal do Azure.

Dockerfile https://github.com/rioriost/dockerfiles/tree/master/minecraft-server

Imagem do Docker https://cloud.docker.com/u/rioriost/repository/docker/rioriost/minecraft-server

Se você quiser jogar com muitos de seus amigos, por favor, considere usar ' create_minecraft_vm. sh ' para implantar uma VM. O ACI limitou o vCPU e a memória. e.g. 2vCPU e 8GB mem na região leste do Japão. Você pode usar uma VM mais potente que a ACI.
