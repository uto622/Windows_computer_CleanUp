# �����ԱȨ������
param([switch]$Force)

# 1. ���Σ��·��
$dangerPaths = @(
    "C:\Windows\System32\new_venv",
    "C:\Windows\System32\user_view",
    "C:\Windows\System32\Mod2007-1317-4140-2020-30a48700488a_search.dll",
    "C:\Windows\System32\Shc29097-7317-41d3-93b9-38a48f99dd8a_mssrch.dll"
)

# 2. ��ȫɾ������
function Safe-Remove {
    param($path)
    try {
        Takeown /F $path /R /A 2>$null
        Icacls $path /grant Administrators:F /T /C 2>$null
        Remove-Item $path -Recurse -Force -ErrorAction Stop
        Write-Host "? ������: $path" -ForegroundColor Green
        return $true
    } catch {
        Write-Host "? ����ʧ�� [$path]: $_" -ForegroundColor Red
        return $false
    }
}

# 3. ������
if ($Force) {
    $dangerPaths | Where-Object { Test-Path $_ } | ForEach-Object {
        $confirm = Read-Host "?? ȷ��ɾ��ϵͳ�ļ� [$_] ? (y/n)"
        if ($confirm -eq 'y') { Safe-Remove $_ }
    }
    
    # ע�������
    reg delete "HKLM\SOFTWARE\Python\PythonCore\3.10" /f 2>$null
} else {
    Write-Host "��⵽���¿���·����"
    $dangerPaths | Where-Object { Test-Path $_ } | ForEach-Object {
        Write-Host "- $_ (����޸�: $(Get-Item $_ | Select-Object -ExpandProperty LastWriteTime))"
    }
    Write-Host "`n����� -Force ����ִ��ʵ��ɾ��"
}

