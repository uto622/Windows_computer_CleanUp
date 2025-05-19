@echo off
:: 安装VS Build Tools后运行此脚本

:: 1. 设置MSVC路径
set "VS_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Tools\MSVC\14.29.30133\bin\Hostx64\x64"
set PATH=%VS_PATH%;%PATH%

:: 2. 设置CUDA路径
set "CUDA_PATH=C:\CUDA\V11.8"
set PATH=%CUDA_PATH%\bin;%PATH%

:: 3. 验证环境
cl /?
nvcc --version
where nsys

:: 4. 编译样例
cd %CUDA_PATH%\extras\demo_suite
nvcc matrixMul.cpp -o matrixMul.exe
if exist matrixMul.exe (
    matrixMul.exe
) else (
    echo 编译失败，请检查错误信息
)
pause