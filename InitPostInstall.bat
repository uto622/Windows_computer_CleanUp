# ��ʼ���ű�����װϵͳ������
# ·�����鱣��Ϊ D:\InitPostInstall.ps1

# ���������ļ���
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\Downloads\Installers"
New-Item -ItemType Directory -Force -Path "D:\Projects"
New-Item -ItemType Directory -Force -Path "D:\AI_Platform"

# �ر������ͷſռ�
powercfg -h off

# ��ʾ�ļ���չ��������ϵͳ�ļ�ȡ��
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name HideFileExt -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name Hidden -Value 1

# ����Windows�Ƽ����ݣ���ʼ�˵��Ƽ���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f

# ����������Сͼ�� & �ر�����ͼ�꣨��ѡ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSmallIcons /t REG_DWORD /d 1 /f
