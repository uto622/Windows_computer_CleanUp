@echo off
echo Cleaning Windows logs and temporary cache...
del /q /f %TEMP%\*
del /q /f C:\Windows\Temp\*
echo Done.
pause