
Add-Type -AssemblyName PresentationFramework

[System.Windows.MessageBox]::Show("即將開始自動掃描與清理 Canva / Perplexity / ComfyUI / Python310 殘留路徑","清理提示")

$appNames = @("Canva", "Perplexity", "Python310", "ComfyUI")

foreach ($app in $appNames) {
    $paths = @(
        "$env:LOCALAPPDATA\Programs\$app",
        "$env:APPDATA\$app"
    )
    foreach ($path in $paths) {
        if (Test-Path $path) {
            Remove-Item -Path $path -Recurse -Force -ErrorAction SilentlyContinue
            Write-Host "🧹 已清除: $path" -ForegroundColor Green
        } else {
            Write-Host "✅ 路徑不存在: $path" -ForegroundColor DarkGray
        }
    }
}

[System.Windows.MessageBox]::Show("初步清理完成。若需創建軟連結（Symbolic Link）請點選確定。","清理完成")

# Symbolic Links (if targets exist)
if (!(Test-Path "C:\Users\user\AppData\Local\Programs\ComfyUI")) {
    cmd /c mklink /D "C:\Users\user\AppData\Local\Programs\ComfyUI" "D:\AI\ComfyUI"
}

if (!(Test-Path "C:\Users\user\AppData\Local\Programs\Python310")) {
    cmd /c mklink /D "C:\Users\user\AppData\Local\Programs\Python310" "D:\AI\Python310"
}

[System.Windows.MessageBox]::Show("軟連結建立完成（如有權限請以系統管理員模式再次確認）。","完成")
