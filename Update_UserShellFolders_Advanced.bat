@echo off
:: 更新桌面與下載路徑為 D 槽對應資料夾

echo === Windows 使用者資料夾重新指派 ===
echo.
echo [1] 檢查目前路徑設定...

reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v {374DE290-123F-4565-9164-39C4925E467B}

echo.
echo [2] 正在更新 Desktop 和 Downloads 的預設路徑至 D 槽...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop /t REG_EXPAND_SZ /d "D:\UserData\Desktop" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v {374DE290-123F-4565-9164-39C4925E467B} /t REG_EXPAND_SZ /d "D:\UserData\Downloads" /f

echo.
echo [3] 變更完成 ✅ 請手動登出並重新登入帳號，變更才會生效。
pause
