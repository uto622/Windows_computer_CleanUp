@echo off
setlocal EnableDelayedExpansion
title 一鍵清理 Temp + NVIDIA 安裝殘留
echo ================================
echo ?? 開始清理臨時檔與 NVIDIA 安裝包
echo ================================
echo.

:: 1. 清除使用者 TEMP 資料夾
echo ?? 清理 %TEMP%...
del /f /s /q "%TEMP%\*.*"
for /d %%i in ("%TEMP%\*") do rd /s /q "%%i"

:: 2. 清除系統 TEMP 資料夾
echo ?? 清理 C:\Windows\Temp...
del /f /s /q "C:\Windows\Temp\*.*"
for /d %%i in ("C:\Windows\Temp\*") do rd /s /q "%%i"

:: 3. 清除 NVIDIA 安裝包資料夾（佔用空間大）
if exist "C:\NVIDIA" (
    echo ?? 清理 C:\NVIDIA 安裝包...
    rd /s /q "C:\NVIDIA"
)

:: 4. 清除 NVIDIA 安裝日誌（可選）
if exist "C:\ProgramData\NVIDIA Corporation\Installer2" (
    echo ?? 清理 NVIDIA 安裝日誌...
    rd /s /q "C:\ProgramData\NVIDIA Corporation\Installer2"
)

echo.
echo ? 清理完成！你可以重啟系統以釋放所有鎖定資源。
echo ================================
pause
exit
