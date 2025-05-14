
$logFile = "D:\AIPlatform\Drivers\NVIDIA_CUDA_11.8\cuDNN_Setup_Log.txt"
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

function Write-Log($msg) {
    Add-Content -Path $logFile -Value "$timestamp`t$msg"
}

Write-Log "启动 CUDA 环境变量设置..."

$envPaths = [Environment]::GetEnvironmentVariable("Path", "Machine").Split(";")

if (-not ($envPaths -contains "D:\AIPlatform\Drivers\NVIDIA_CUDA_11.8\bin")) {
    $newPath = ($envPaths + "D:\AIPlatform\Drivers\NVIDIA_CUDA_11.8\bin") -join ";"
    [Environment]::SetEnvironmentVariable("Path", $newPath, "Machine")
    Write-Log "添加 bin 路径成功"
} else {
    Write-Log "bin 路径已存在"
}

if (-not ($envPaths -contains "D:\AIPlatform\Drivers\NVIDIA_CUDA_11.8\libnvvp")) {
    $newPath = ([Environment]::GetEnvironmentVariable("Path", "Machine").Split(";") + "D:\AIPlatform\Drivers\NVIDIA_CUDA_11.8\libnvvp") -join ";"
    [Environment]::SetEnvironmentVariable("Path", $newPath, "Machine")
    Write-Log "添加 libnvvp 路径成功"
} else {
    Write-Log "libnvvp 路径已存在"
}

Write-Log "CUDA 环境变量设置完成"
