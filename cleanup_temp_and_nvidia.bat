@echo off
setlocal EnableDelayedExpansion
title һ�I���� Temp + NVIDIA ���b����
echo ================================
echo ?? �_ʼ�����R�r�n�c NVIDIA ���b��
echo ================================
echo.

:: 1. ���ʹ���� TEMP �Y�ϊA
echo ?? ���� %TEMP%...
del /f /s /q "%TEMP%\*.*"
for /d %%i in ("%TEMP%\*") do rd /s /q "%%i"

:: 2. ���ϵ�y TEMP �Y�ϊA
echo ?? ���� C:\Windows\Temp...
del /f /s /q "C:\Windows\Temp\*.*"
for /d %%i in ("C:\Windows\Temp\*") do rd /s /q "%%i"

:: 3. ��� NVIDIA ���b���Y�ϊA�����ÿ��g��
if exist "C:\NVIDIA" (
    echo ?? ���� C:\NVIDIA ���b��...
    rd /s /q "C:\NVIDIA"
)

:: 4. ��� NVIDIA ���b���I�����x��
if exist "C:\ProgramData\NVIDIA Corporation\Installer2" (
    echo ?? ���� NVIDIA ���b���I...
    rd /s /q "C:\ProgramData\NVIDIA Corporation\Installer2"
)

echo.
echo ? ������ɣ�������؆�ϵ�y��ጷ������i���YԴ��
echo ================================
pause
exit
