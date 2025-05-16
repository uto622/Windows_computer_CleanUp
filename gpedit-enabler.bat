@echo off
echo ============================================
echo 正在启用组策略编辑器 gpedit.msc...
echo 请稍候，这可能需要几分钟。
echo ============================================
DISM /Online /Enable-Feature /FeatureName:Microsoft-Windows-GroupPolicy-ClientTools /All /Quiet
DISM /Online /Enable-Feature /FeatureName:Microsoft-Windows-GroupPolicy-ClientExtensions /All /Quiet

echo 注册组件...
regsvr32 /s gpedit.dll
regsvr32 /s fde.dll
regsvr32 /s gptext.dll

echo 完成。
echo 如果没有报错，你可以运行 gpedit.msc 打开组策略编辑器。
pause
