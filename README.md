# Phpmyadmin + MySQL 

- 自動使用docker 部屬phpmyadmin環境與mysql
- 自動設定開機運行docker-compose服務

- - -

## 如何運行
以下是運行項目的步驟：

### 0. 快速安装...

腳本自動化安裝
```
./ubuntu_setup_dockercompose-service.sh
```

確認容器是否運行
```
docker ps
```

想手動安裝可自己操作下面步驟

### 1. 安裝 Docker Compose

在 Ubuntu 上，您可以使用 `apt` 進行安裝：

```bash
sudo apt update
sudo apt install docker-compose
```

### 2. 修改 Docker Compose 文件

打開 docker-compose.yml 文件，並修改其中的用戶名和密碼等設置。

```
services:
  db:
    image: mysql
    environment:
      MYSQL_DATABASE: exampledb
      MYSQL_USER: exampleuser  # 修改為您的用戶名
      MYSQL_PASSWORD: examplepass  # 修改為您的密碼
```

### 3. 運行 Docker Compose

使用以下命令啟動您的 Docker 容器：
```
docker-compose up -d
```

### 4. 檢查防火牆設置

確保 8080 端口已開放。在 Ubuntu 上，您可以使用 ufw 進行管理
```
sudo ufw allow 8080
```
### 5. 設置開機自動運行(非必要)

- Ubutnu Shell:

```
chmod +x ubuntu_setup_dockercompose-service.sh
./ubuntu_setup_dockercompose-service.sh
```

- Windows PowerShell:

```
Set-ExecutionPolicy RemoteSigned
.\windows_setup_dockercompose-service.ps1
```

## 如何停止

要停止並移除容器、網絡、卷和映像
```
docker-compose down
```

- - -


> [!TIP]可能遇到的問題


1. 容器無法啟動

    - 原因：配置錯誤、映像不存在、環境變數設置錯誤、掛載卷權限問題等。
    - 解決方法：檢查 Docker Compose 配置文件，確保所有設置正確，並檢查日誌以找出具體錯誤。

2. 端口衝突

   - 原因：Docker 容器配置的端口已被宿主機上的其他程序使用。
   - 解決方法：更改容器配置中的端口號或停止占用該端口的程序。

3. 網絡連接問題

   - 原因：防火牆設置、網絡配置錯誤。
   - 解決方法：檢查宿主機的防火牆設置，確保容器可以訪問外部網絡。

4. 數據卷問題

   - 原因：卷掛載錯誤、路徑設置不正確、權限不足。
   - 解決方法：檢查掛載卷的路徑和權限設置。

5. 環境變數配置不當

   - 原因：缺少必要的環境變數、環境變數值錯誤。
   - 解決方法：確保所有必要的環境變數都已正確設置。

6. 版本不兼容

   - 原因：Docker 或 Docker Compose 的版本與 yml 文件格式不兼容。
   - 解決方法：更新 Docker 和 Docker Compose 至兼容版本或修改 yml 文件以適應當前版本。

7. 服務依賴問題

   - 原因：一個服務依賴於另一個尚未準備好的服務。
   - 解決方法：使用 depends_on 參數來管理容器啟動順序。

8. 資源限制

   - 原因：分配給容器的資源（如內存、CPU）不足。
   - 解決方法：增加資源分配或調整服務以減少資源需求。

9. 映像拉取問題

   - 原因：無法從 Docker Hub 或其他註冊表拉取映像。
   - 解決方法：檢查網絡連接，確保映像名稱和標籤正確。

10. 配置文件語法錯誤

   - 原因：Docker Compose 文件格式錯誤。
   - 解決方法：使用 YAML 驗證工具檢查語法並修正錯誤。

