# 1. �ռ����а��� NVIDIA �� CUDA ��ж���ַ���
$apps = Get-ItemProperty `
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" ,
    "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" |
    Where-Object { $_.DisplayName -match 'NVIDIA|CUDA' } |
    Select-Object DisplayName, UninstallString

# 2. ��Ĭж��
foreach($app in $apps){
    Write-Host "Uninstalling $($app.DisplayName) ..."
    # ����ж���ַ��������� /S /quiet �Ѿ�Ĭ��������׷��
    $cmd = if($app.UninstallString -notmatch '/quiet|/S'){
        "$($app.UninstallString) /quiet /norestart"
    }else{ $app.UninstallString }

    Start-Process -FilePath "cmd.exe" -ArgumentList "/c", $cmd -Wait
}
Write-Host "`n>>> ��ɣ�����ϵͳ����������ļ���"
