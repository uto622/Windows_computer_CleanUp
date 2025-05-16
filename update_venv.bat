@echo off
call D:\AIPlatform\venv\Scripts\activate.bat
python -m pip install --upgrade pip
pip install --upgrade setuptools wheel
echo 虚拟环境工具已更新！
pause