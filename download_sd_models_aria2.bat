@echo off
echo ✅ 正在使用 aria2c 批量下載 Stable Diffusion 模型...

:: 確保已安裝 aria2（可手動從 https://aria2.github.io/ 下載）
where aria2c >nul 2>nul || (
    echo ❌ 未檢測到 aria2c，請先安裝 aria2 並加入系統 PATH
    pause
    exit /b
)

:: 設定下載目錄
set MODEL_DIR=D:\AI\models\checkpoints
mkdir "%MODEL_DIR%"

:: SD 1.5 模型 (.ckpt)
aria2c -x 16 -s 16 -k 1M -d "%MODEL_DIR%" -o v1-5-pruned-emaonly.ckpt https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt

:: SDXL Base 模型 (.safetensors)
aria2c -x 16 -s 16 -k 1M -d "%MODEL_DIR%" -o sd_xl_base_1.0.safetensors https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors

:: SDXL Refiner 模型 (.safetensors)
aria2c -x 16 -s 16 -k 1M -d "%MODEL_DIR%" -o sd_xl_refiner_1.0.safetensors https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors

echo ✅ 模型下載完成！
pause
