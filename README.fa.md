# deploy_minecraft این اسکریپت ساده ، create_minecraft. sh اعزام یک سرور minecraft به عنوان یک ظرف به ACI ، نمونه کانتینر Azure ، فعال برای اتصال از راه دور با MCRCON. فقط آنچه شما باید انجام دهید این است که تغییر 6 فقط پارامترهای فقط خواندنی در ابتدای اسکریپت. قبل از استقرار یک ظرف ، شما باید Azure CLI (https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli?view=azure-cli-latest) را نصب کنید و به Azure مشترک شوید. اگر شما به Azure مشترک شده اید ، این ساده ترین برای اجرای اسکریپت در پوسته ابر از پورتال Azure است. Dockerfile https://github.com/rioriost/dockerfiles/tree/master/minecraft-server تصویر Docker https://cloud.docker.com/u/rioriost/repository/docker/rioriost/minecraft-server اگر می خواهید با بسیاری از دوستان خود بازی کنید ، لطفا در نظر بگیرید از ' create_minecraft_vm. sh ' برای استقرار یک VM استفاده کنید. ACI دارای vCPU و حافظه محدود است. به عنوان مثال 2vCPU و 8GB mem در منطقه ژاپن شرق. شما می توانید VM قدرتمند تر از ACI استفاده کنید.