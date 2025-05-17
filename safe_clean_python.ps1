# 需管理员权限运行
param([switch]$Force)

# 1. 标准Python安装位置清理
$pyPaths = @(
    "$env:USERPROFILE\AppData\Local\Programs\Python",
    "C:\Python*",
    "D:\Python*",
    "D:\AI_Platform\Venv",
    "$env:USERPROFILE\.conda",
    "$env:USERPROFILE\.virtualenvs"
)

# 2. 异常路径特殊处理（需确认后手动删除）
$dangerousPaths = @(
    "C:\Windows\System32\new_venv"  # 需特别确认该路径合法性
)

if ($Force) {
    # 安全删除标准路径
    $pyPaths | Where-Object { Test-Path $_ } | ForEach-Object {
        Write-Host "删除: $_"
        Remove-Item $_ -Recurse -Force -ErrorAction Continue
    }

    # 危险路径需二次确认
    $dangerousPaths | ForEach-Object {
        if (Test-Path $_) {
            $confirm = Read-Host "?? 即将删除系统目录 $_，确认继续？(y/n)"
            if ($confirm -eq 'y') {
                Takeown /F $_ /R /A | Out-Null
                Icacls $_ /grant Administrators:F /T | Out-Null
                Remove-Item $_ -Recurse -Force
            }
        }
    }
} else {
    Write-Host "检测到以下Python安装："
    $pyPaths + $dangerousPaths | Where-Object { Test-Path $_ } | ForEach-Object {
        Write-Host "- $_"
    }
    Write-Host "`n请添加 -Force 参数执行实际删除"
}