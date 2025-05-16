# Clean_Registry_Python.ps1
# 用于清除 Python 注册表项（需管理员权限运行）
$keys = @(
    "HKCU:\Software\Python",
    "HKLM:\Software\Python",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall",
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall"
)

foreach ($key in $keys) {
    Get-ChildItem -Path $key -ErrorAction SilentlyContinue | Where-Object {
        $_.Name -like "*Python*"
    } | ForEach-Object {
        Remove-Item -Path $_.PsPath -Recurse -Force -ErrorAction SilentlyContinue
    }
}