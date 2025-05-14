
$LogPath = "D:\AIPlatform\Logs\NVIDIA_Install_Log.txt"
$Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$NvidiaFolder = "C:\NVIDIA"

# 写入日志函数
function Write-Log {
    param([string]$message)
    Add-Content -Path $LogPath -Value "$Timestamp `t $message"
}

# 判断文件夹是否存在
if (Test-Path $NvidiaFolder) {
    try {
        Remove-Item -Path $NvidiaFolder -Recurse -Force
        Write-Log "已清理 $NvidiaFolder"
    } catch {
        Write-Log "清理 $NvidiaFolder 失败：$($_.Exception.Message)"
    }
} else {
    Write-Log "$NvidiaFolder 不存在，无需清理"
}
