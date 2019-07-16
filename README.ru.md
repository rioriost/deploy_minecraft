#Развертывание минкрафта

Этот простой скрипт, create'minecraft.sh, развертывает сервер minecraft в качестве контейнера для ACI, Azure Container Instances, что позволяет быть удаленно подключенным с MCRCON. Только то, что вам нужно сделать, это изменить 6 только для чтения параметров в начале сценария.

Перед развертыванием контейнера необходимо установить Azure CLI (https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli?view=azure-cli-latest) и подписаться на Azure.

Если вы подписались на Azure, проще всего запустить скрипт в оболочке облака с портала Azure.

Докерфиль https://github.com/rioriost/dockerfiles/tree/master/minecraft-server

Докер изображение https://cloud.docker.com/u/rioriost/repository/docker/rioriost/minecraft-server

Если вы хотите играть с большим количеством ваших друзей, пожалуйста, рассмотрите возможность использования 'create'minecraft'vm.sh' для развертывания VM. ACI имеет ограниченный VCPU и память. например, 2VCPU и 8 GB MEM в Восточном регионе Японии. Вы можете использовать более мощный VM, чем ACI.
