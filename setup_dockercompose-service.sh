#!/bin/bash

# 定義服務文件的路徑
SERVICE_FILE=/etc/systemd/system/compose-phpmyadmin.service

# 創建 systemd 服務文件
echo "[Unit]
Description=My Docker Compose Application Service
Requires=docker.service
After=docker.service

[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=$(pwd)
ExecStart=/usr/bin/docker-compose up -d
ExecStop=/usr/bin/docker-compose down

[Install]
WantedBy=multi-user.target" | sudo tee $SERVICE_FILE

# 重新加載 systemd，使新的服務文件生效
sudo systemctl daemon-reload

# 啟用並啟動創建的服務
sudo systemctl enable compose-phpmyadmin.service
sudo systemctl start compose-phpmyadmin.service

echo "Service compose-phpmyadmin has been enabled and started."
