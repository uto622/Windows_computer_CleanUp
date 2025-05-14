
; AutoHotKey Script to Batch Export .prj files to .dxf using ET Software

#SingleInstance Force
SetTitleMatchMode, 2
SendMode Input
SetWorkingDir %A_ScriptDir%

; 设置文件夹路径
InputBox, FolderPath, Folder Location, Please enter the full path of your .prj files folder:
if FolderPath =
{
    MsgBox, Operation canceled.
    ExitApp
}

Loop, Files, %FolderPath%\*.prj
{
    Run, C:\Path\To\ETSoftware.exe "%A_LoopFileFullPath%" ; 请替换为ET软件的实际路径
    WinWaitActive, ET SYSTEM

    Sleep, 2000 ; 等待加载完

    ; 模拟导出操作
    Send, !f        ; 打开文件菜单（Alt+F）
    Sleep, 300
    Send, e         ; 假设导出是 e（请替换为实际热键）
    Sleep, 300
    Send, {Enter}   ; 确认导出
    Sleep, 1000     ; 等待保存完成

    ; 关闭当前文件或软件
    Send, ^w        ; 假设 Ctrl+W 是关闭当前项目
    Sleep, 1000
}

MsgBox, Batch export complete.
ExitApp
