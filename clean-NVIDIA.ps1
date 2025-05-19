# 1. 收集所有包含 NVIDIA 或 CUDA 的卸载字符串
$apps = Get-ItemProperty `
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" ,
    "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" |
    Where-Object { $_.DisplayName -match 'NVIDIA|CUDA' } |
    Select-Object DisplayName, UninstallString

# 2. 静默卸载
foreach($app in $apps){
    Write-Host "Uninstalling $($app.DisplayName) ..."
    # 部分卸载字符串带参数 /S /quiet 已静默；如无则追加
    $cmd = if($app.UninstallString -notmatch '/quiet|/S'){
        "$($app.UninstallString) /quiet /norestart"
    }else{ $app.UninstallString }

    Start-Process -FilePath "cmd.exe" -ArgumentList "/c", $cmd -Wait
}
Write-Host "`n>>> 完成！重启系统以清理残余文件。"
