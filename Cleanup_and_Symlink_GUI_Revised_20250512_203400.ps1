Add-Type -AssemblyName PresentationFramework

[System.Windows.MessageBox]::Show("将删除旧路径并构建 Symbolic Link 链接，请确认操作", "欢迎重建路径✅")

$appNames = @("Canva", "Perplexity", "Python310", "ComfyUI")

foreach ($app in $appNames) {
    $paths = @(
        "$env:LOCALAPPDATA\Programs\$app",
        "$env:APPDATA\$app"
    )
    foreach ($path in $paths) {
        if (Test-Path $path) {
            Remove-Item -Path $path -Recurse -Force -ErrorAction SilentlyContinue
            Write-Host "✅ 删除成功: $path" -ForegroundColor Green
        } else {
            Write-Host "✅ 路径不存在: $path" -ForegroundColor DarkGray
        }
    }

    $target = "D:\AI\$app"
    $link = "$env:LOCALAPPDATA\Programs\$app"

    if (-Not (Test-Path $target)) {
        New-Item -ItemType Directory -Path $target | Out-Null
        Write-Host "📁 已创建新目录: $target" -ForegroundColor Yellow
    }

    if (-Not (Test-Path $link)) {
        cmd /c mklink /D "$link" "$target"
        Write-Host "🔗 已创建 Symbolic Link: $link -> $target" -ForegroundColor Cyan
    } else {
        Write-Host "⚠️ 已存在路径 $link，请手动检查是否为链接" -ForegroundColor Magenta
    }
}

[System.Windows.MessageBox]::Show("路径迁移完成，建议立即重启部分程序或系统以确保生效", "操作完成✅")
