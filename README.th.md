# deploy_minecraft

สคริปต์นี้ง่าย, create_minecraft จัดวางเซิร์ฟเวอร์ minecraft เป็นภาชนะที่จะ ACI, อินสแตนซ์ของคอนเทนเนอร์ Azure, เปิดใช้งานการเชื่อมต่อจากระยะไกลกับ MCRCON. เฉพาะสิ่งที่คุณต้องทำคือการเปลี่ยนแปลง6พารามิเตอร์แบบอ่านอย่างเดียวในจุดเริ่มต้นของสคริปต์ ก่อนที่จะปรับใช้คอนเทนเนอร์คุณต้องติดตั้ง Azure CLI (https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli?view=azure-cli-latest) และสมัครสมาชิก Azure ถ้าคุณสมัครใช้งาน Azure เป็นการง่ายที่สุดในการรันสคริปต์บน Cloud เชลล์จากเว็บไซต์ Azure

ไฟล์ https://github.com/rioriost/dockerfiles/tree/master/minecraft-server

รูปภาพ https://cloud.docker.com/u/rioriost/repository/docker/rioriost/minecraft-server

ถ้าคุณต้องการที่จะเล่นกับจำนวนมากของเพื่อนของคุณ, โปรดพิจารณาที่จะใช้ ' create_minecraft_vm ' เพื่อจัดวาง VM. ACI มีการจำกัด vCPU และหน่วยความจำ. เช่น2vCPU และ 8GB mem ในภูมิภาคญี่ปุ่นตะวันออก คุณสามารถใช้ VM ที่มีประสิทธิภาพมากกว่า ACI
