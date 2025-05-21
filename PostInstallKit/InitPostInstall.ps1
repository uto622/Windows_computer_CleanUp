# 初始化脚本：初装系统后运行
# 建议保存为 D:\InitPostInstall.ps1

# 创建常用文件夹
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\Downloads\Installers"
New-Item -ItemType Directory -Force -Path "D:\Projects"
New-Item -ItemType Directory -Force -Path "D:\AI_Platform"

# 关闭休眠释放空间
powercfg -h off

# 显示文件扩展名、隐藏系统文件取消
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name HideFileExt -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name Hidden -Value 1

# 禁用Windows推荐内容（开始菜单推荐）
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f

# 设置任务栏小图标 & 关闭搜索图标（可选）
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSmallIcons /t REG_DWORD /d 1 /f
