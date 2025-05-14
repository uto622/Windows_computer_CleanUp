# PowerShell：自動遷移應用 AppData 資料夾到 D:\AI  來源目的寫清楚方便後續追蹤
Write-Host "準備開始搬移應用資料夾到 D:\AI 請稍候..." -ForegroundColor Cyan

$apps = @(
    @{ Source = "$env:LOCALAPPDATA\Programs\Canva";        Target = "D:\AI\Canva" },
    @{ Source = "$env:LOCALAPPDATA\Programs\ComfyUI";      Target = "D:\AI\ComfyUI" },
    @{ Source = "$env:LOCALAPPDATA\Programs\Perplexity";   Target = "D:\AI\Perplexity" },
    @{ Source = "$env:LOCALAPPDATA\Programs\Python\Python310"; Target = "D:\AI\Python310" }
)

foreach ($app in $apps) {
    if (Test-Path $app.Source) {
        Write-Host "✅ 開始搬移：$($app.Source)" -ForegroundColor Yellow
        Move-Item -Path $app.Source -Destination $app.Target -Force -ErrorAction SilentlyContinue
        Write-Host "🎯 搬移完成：$($app.Target)" -ForegroundColor Green
    }
    else {
        Write-Host "⚠️ 未找到路徑：$($app.Source)，是否已安裝？" -ForegroundColor DarkGray
    }
}

Write-Host "`n💡 完成搬移！請確認是否仍需卸載原安裝版本。" -ForegroundColor Cyan
Pause
