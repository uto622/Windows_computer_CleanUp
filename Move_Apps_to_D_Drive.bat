@echo off
:: Arc Browser 搬遷（請根據實際安裝路徑調整）
echo 搬遷 Arc Browser...
move "C:\Program Files\Arc" "D:\BrowserTools\Arc"

:: Canva 搬遷
echo 搬遷 Canva...
move "C:\Program Files\Canva" "D:\AppTools\Canva"

:: ComfyUI 搬遷
echo 搬遷 ComfyUI...
move "C:\Program Files\ComfyUI" "D:\AI_PLATFORM\ComfyUI"

echo ✅ 所有應用已搬移完畢（如遇錯誤請確認來源路徑是否正確）
pause
