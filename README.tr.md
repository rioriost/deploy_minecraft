# deploy_minecraft

Bu basit komut dosyası, create_minecraft. sh, MCRCON ile uzaktan bağlanacak şekilde etkin bir Minecraft sunucusunu acı, Azure Kapsayıcı örnekleri için bir kapsayıcı olarak dağıtır. Sadece yapmanız gereken, Script başında 6 ReadOnly parametrelerini değiştirmek.

Bir kapsayıcı dağıtmadan önce Azure CLı (https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli?view=azure-cli-latest) yüklemeniz ve Azure 'a abone olmalısınız.

Azure 'a abone iseniz, Azure portalı 'ndan bulut kabuğu 'nda komut dosyasını çalıştırmak en kolay budur.

Dockerfile https://github.com/rioriost/dockerfiles/tree/master/minecraft-server

Docker görüntüsü https://cloud.docker.com/u/rioriost/repository/docker/rioriost/minecraft-server

Arkadaşlarınızla birçok oynamak istiyorsanız, bir VM dağıtmak için ' create_minecraft_vm. sh ' kullanmayı düşünün lütfen. ACı, vCPU ve belleğe sınırlıdır. Örneğin 2vCPU ve 8GB mem Japonya Doğu bölgesinde. ACı 'dan daha güçlü bir VM kullanabilirsiniz.
