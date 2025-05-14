# ======================
# ⚠️ Python Registry Cleanup Tool
# Author: ChatGPT for file 404
# ======================

Write-Host "🚧 開始清除 Python 相關註冊表與殘留..." -ForegroundColor Cyan

# 刪除當前用戶的 Python 類型檔案關聯
Remove-Item -Path "HKCU:\Software\Classes\Python.File" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "HKCU:\Software\Classes\Python.NoConFile" -Recurse -Force -ErrorAction SilentlyContinue

# 刪除 Cloud Store Appx Metadata
$cloudKeys = @(
  "HKCU:\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\DefaultAccount"
)
foreach ($key in $cloudKeys) {
    Get-ChildItem -Path $key -Recurse -ErrorAction SilentlyContinue | Where-Object {
        $_.Name -match "pythonsoftwarefoundation"
    } | ForEach-Object {
        Remove-Item -Path $_.PsPath -Recurse -Force -ErrorAction SilentlyContinue
    }
}

# 刪除 AppModel 記憶殘留
Remove-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AppModel\PolicyCache" -Recurse -Force -ErrorAction SilentlyContinue

# 刪除 RecentDocs 跟 PushNotifications 中有 Python 的部分
Remove-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications\Backup" -Recurse -Force -ErrorAction SilentlyContinue

# 刪除 Python 安裝目錄（視情況修改）
$pythonDirs = @(
  "$env:LOCALAPPDATA\Programs\Python",
  "$env:APPDATA\Python",
  "$env:LOCALAPPDATA\Python",
  "C:\Program Files\Python*",
  "C:\Program Files (x86)\Python*"
)
foreach ($path in $pythonDirs) {
  if (Test-Path $path) {
    Remove-Item -Path $path -Recurse -Force -ErrorAction SilentlyContinue
  }
}

Write-Host "✅ 所有清除任務完成，請重新啟動後重新安裝。" -ForegroundColor Green
