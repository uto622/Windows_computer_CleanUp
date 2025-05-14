
$BasePath = "D:\AIPlatform"

# Create required folders if not exist
$folders = @("Apps", "Tools", "Models", "Env", "Drivers", "Configs", "Projects", "ComfyUI", "SDWebUI", "Archive", "Logs")
foreach ($folder in $folders) {
    $target = Join-Path $BasePath $folder
    if (!(Test-Path $target)) {
        New-Item -ItemType Directory -Path $target | Out-Null
    }
}

# Define source to destination mapping
$moveMap = @{
    "Canva"        = "Apps"
    "Perplexity"   = "Apps"
    "Python 3.1.0" = "Apps"
    "Aria2"        = "Tools"
    "ComfyUI"      = "ComfyUI"
    "SDWebUI"      = "SDWebUI"
    "Drivers"      = "Drivers"
    "Env"          = "Env"
    "Models"       = "Models"
    "Logs"         = "Logs"
    "Archive"      = "Archive"
    "Assets"       = "Configs"
}

$logFile = Join-Path $BasePath "Logs\migration_log.txt"
Add-Content $logFile "`n--- Smart Migration Log $(Get-Date -Format "yyyy-MM-dd HH:mm:ss") ---"

# Move folders to target destinations if they are not already in the target
foreach ($source in $moveMap.Keys) {
    $srcPath = Join-Path $BasePath $source
    $dstRoot = Join-Path $BasePath $moveMap[$source]
    $dstPath = Join-Path $dstRoot $source

    if (Test-Path $srcPath) {
        # Skip if srcPath is already inside its target root
        if ($srcPath.StartsWith($dstRoot)) {
            Add-Content $logFile "Skipped (already inside target): $source"
        }
        elseif (!(Test-Path $dstPath)) {
            Move-Item -Path $srcPath -Destination $dstPath
            Add-Content $logFile "Moved: $source -> $dstPath"
        } else {
            Add-Content $logFile "Skipped (destination exists): $source"
        }
    } else {
        Add-Content $logFile "Not found: $source"
    }
}

Add-Content $logFile "Smart migration completed.`n"
