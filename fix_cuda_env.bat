@echo off
:: ��װVS Build Tools�����д˽ű�

:: 1. ����MSVC·��
set "VS_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Tools\MSVC\14.29.30133\bin\Hostx64\x64"
set PATH=%VS_PATH%;%PATH%

:: 2. ����CUDA·��
set "CUDA_PATH=C:\CUDA\V11.8"
set PATH=%CUDA_PATH%\bin;%PATH%

:: 3. ��֤����
cl /?
nvcc --version
where nsys

:: 4. ��������
cd %CUDA_PATH%\extras\demo_suite
nvcc matrixMul.cpp -o matrixMul.exe
if exist matrixMul.exe (
    matrixMul.exe
) else (
    echo ����ʧ�ܣ����������Ϣ
)
pause