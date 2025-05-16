@echo off
echo [INFO] Copying CUDA DLLs to PyTorch lib directory...
set CUDA_SRC="D:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.8\bin"
set TORCH_LIB="C:\Users\%USERNAME%\AppData\Local\Programs\Python\Python310\Lib\site-packages\torch\lib"

if exist %CUDA_SRC% (
    copy %CUDA_SRC%\cudart64_110.dll %TORCH_LIB% /Y
    copy %CUDA_SRC%\cublas64_11.dll %TORCH_LIB% /Y
    copy %CUDA_SRC%\cufft64_10.dll %TORCH_LIB% /Y
    copy %CUDA_SRC%\curand64_10.dll %TORCH_LIB% /Y
)
echo [DONE] Patch complete.
pause