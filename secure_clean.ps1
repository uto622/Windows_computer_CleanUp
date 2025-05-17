# 需管理员权限运行
param([switch]$Force)

# 1. 检查危险路径
$dangerPaths = @(
    "C:\Windows\System32\new_venv",
    "C:\Windows\System32\user_view",
    "C:\Windows\System32\Mod2007-1317-4140-2020-30a48700488a_search.dll",
    "C:\Windows\System32\Shc29097-7317-41d3-93b9-38a48f99dd8a_mssrch.dll"
)

# 2. 安全删除函数
function Safe-Remove {
    param($path)
    try {
        Takeown /F $path /R /A 2>$null
        Icacls $path /grant Administrators:F /T /C 2>$null
        Remove-Item $path -Recurse -Force -ErrorAction Stop
        Write-Host "? 已清理: $path" -ForegroundColor Green
        return $true
    } catch {
        Write-Host "? 清理失败 [$path]: $_" -ForegroundColor Red
        return $false
    }
}

# 3. 主流程
if ($Force) {
    $dangerPaths | Where-Object { Test-Path $_ } | ForEach-Object {
        $confirm = Read-Host "?? 确认删除系统文件 [$_] ? (y/n)"
        if ($confirm -eq 'y') { Safe-Remove $_ }
    }
    
    # 注册表清理
    reg delete "HKLM\SOFTWARE\Python\PythonCore\3.10" /f 2>$null
} else {
    Write-Host "检测到以下可疑路径："
    $dangerPaths | Where-Object { Test-Path $_ } | ForEach-Object {
        Write-Host "- $_ (最后修改: $(Get-Item $_ | Select-Object -ExpandProperty LastWriteTime))"
    }
    Write-Host "`n请添加 -Force 参数执行实际删除"
}

