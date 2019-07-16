# deploy_minecraft

Kịch bản đơn giản này, create_minecraft. sh triển khai một máy chủ Minecraft như một container để ACI, phiên bản container Azure, cho phép được kết nối từ xa với MCRCON. Chỉ những gì bạn cần làm là thay đổi 6 readOnly tham số trong phần đầu của kịch bản.

Trước khi triển khai một vùng chứa, bạn phải cài đặt Azure CLI (https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli?view=azure-cli-latest) và đăng ký Azure.

Nếu bạn đã đăng ký Azure, đó là đơn giản nhất để chạy tập lệnh trên Cloud Shell từ cổng thông tin Azure.

Dockertập tin https://github.com/rioriost/dockerfiles/tree/master/minecraft-server

Ảnh docker https://cloud.docker.com/u/rioriost/repository/docker/rioriost/minecraft-server

Nếu bạn muốn chơi với rất nhiều bạn bè của bạn, hãy xem xét để sử dụng ' create_minecraft_vm. sh ' để triển khai một máy ảo. ACI đã giới hạn vCPU và bộ nhớ. Ví dụ: 2vCPU và 8GB mem ở khu vực phía đông Nhật bản. Bạn có thể sử dụng VM mạnh hơn ACI.
