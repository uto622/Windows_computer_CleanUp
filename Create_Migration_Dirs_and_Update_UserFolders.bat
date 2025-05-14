@echo off
:: 🛠️ 建立搬遷目錄
mkdir D:\AppTools
mkdir D:\BrowserTools
mkdir D:\UserData\Desktop
mkdir D:\UserData\Downloads
mkdir D:\UserData\Documents
mkdir D:\AI_PLATFORM

:: ✅ 搬移桌面與下載資料夾（更新使用者 Shell 資料夾路徑）
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop /t REG_EXPAND_SZ /d "D:\UserData\Desktop" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v {374DE290-123F-4565-9164-39C4925E467B} /t REG_EXPAND_SZ /d "D:\UserData\Downloads" /f

:: ✅ 提示完成
echo 所有搬遷目錄已建立，並更新桌面與下載路徑。
pause
