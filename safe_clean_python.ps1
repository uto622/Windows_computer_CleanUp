# �����ԱȨ������
param([switch]$Force)

# 1. ��׼Python��װλ������
$pyPaths = @(
    "$env:USERPROFILE\AppData\Local\Programs\Python",
    "C:\Python*",
    "D:\Python*",
    "D:\AI_Platform\Venv",
    "$env:USERPROFILE\.conda",
    "$env:USERPROFILE\.virtualenvs"
)

# 2. �쳣·�����⴦����ȷ�Ϻ��ֶ�ɾ����
$dangerousPaths = @(
    "C:\Windows\System32\new_venv"  # ���ر�ȷ�ϸ�·���Ϸ���
)

if ($Force) {
    # ��ȫɾ����׼·��
    $pyPaths | Where-Object { Test-Path $_ } | ForEach-Object {
        Write-Host "ɾ��: $_"
        Remove-Item $_ -Recurse -Force -ErrorAction Continue
    }

    # Σ��·�������ȷ��
    $dangerousPaths | ForEach-Object {
        if (Test-Path $_) {
            $confirm = Read-Host "?? ����ɾ��ϵͳĿ¼ $_��ȷ�ϼ�����(y/n)"
            if ($confirm -eq 'y') {
                Takeown /F $_ /R /A | Out-Null
                Icacls $_ /grant Administrators:F /T | Out-Null
                Remove-Item $_ -Recurse -Force
            }
        }
    }
} else {
    Write-Host "��⵽����Python��װ��"
    $pyPaths + $dangerousPaths | Where-Object { Test-Path $_ } | ForEach-Object {
        Write-Host "- $_"
    }
    Write-Host "`n����� -Force ����ִ��ʵ��ɾ��"
}