# deploy_minecraft

Ez az egyszerű script, create_minecraft. sh telepíti a Minecraft szerver egy konténer ACI, Azure Container példányok, lehetővé tette, hogy csatlakozik távolról MCRCON. Csak annyit kell tennie, hogy változik 6 ReadOnly paraméterek elején a forgatókönyvet.

Egy tároló telepítése előtt telepítenie kell az Azure CLI (https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli?view=azure-cli-latest) programot, és elő kell fizetnie a Azure platformra.

Ha feliratkozott a Azure platformra, akkor az az Azure Portal segítségével futtatható a Cloud Shell szkriptje.

Dockerfile fájl https://github.com/rioriost/dockerfiles/tree/master/minecraft-server

Docker kép https://cloud.docker.com/u/rioriost/repository/docker/rioriost/minecraft-server Ha szeretnél játszani sok barátot, kérjük, fontolja meg, hogy használja a "create_minecraft_vm. sh" telepíteni a VM. ACI korlátozott vCPU és a memória. e.g. 2vCPU és 8GB mem Japánban keleti vidék. Használhatja erősebb VM, mint ACI.
