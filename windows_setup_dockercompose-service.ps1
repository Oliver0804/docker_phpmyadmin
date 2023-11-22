# PowerShell 腳本

# 定義工作目錄和 Docker Compose 命令路徑
$WorkingDirectory = Get-Location
$DockerComposeCommand = "C:\Program Files\Docker\Docker\resources\bin\docker-compose.exe"

# 定義計劃任務的參數
$TaskName = "ComposePhpMyAdmin"
$TaskAction = New-ScheduledTaskAction -Execute $DockerComposeCommand -Argument "up -d" -WorkingDirectory $WorkingDirectory
$TaskTrigger = New-ScheduledTaskTrigger -AtStartup
$TaskSettings = New-ScheduledTaskSettingsSet -StartWhenAvailable

# 創建計劃任務
Register-ScheduledTask -TaskName $TaskName -Action $TaskAction -Trigger $TaskTrigger -Settings $TaskSettings

# 啟動計劃任務
Start-ScheduledTask -TaskName $TaskName
