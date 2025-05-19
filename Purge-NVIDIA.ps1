$paths = @(
  "$Env:ProgramFiles\NVIDIA Corporation",
  "$Env:ProgramData\NVIDIA",
  "$Env:USERPROFILE\.nvidia-omniverse",
  "$Env:APPDATA\NVIDIA Corporation",
  "$Env:LOCALAPPDATA\NVIDIA",
  "$Env:LOCALAPPDATA\NVIDIA Corporation"
)
foreach($p in $paths){
    if(Test-Path $p){
        Write-Host "Removing $p"
        Remove-Item $p -Recurse -Force -ErrorAction SilentlyContinue
    }
}
Write-Host "Done. 建议再重启一次。"
