import os
import shutil
import subprocess
import tkinter as tk
from tkinter import messagebox, scrolledtext
import torch

def check_env():
    output = []
    try:
        output.append("? GPU 名稱與狀態 (nvidia-smi):")
        nvidia_smi = subprocess.check_output("nvidia-smi", shell=True, encoding="utf-8")
        output.append(nvidia_smi)
    except Exception as e:
        output.append(f"? 無法讀取 nvidia-smi: {e}")

    output.append("? CUDA & cuDNN 狀態 (PyTorch 檢測):")
    output.append(f"torch.cuda.is_available(): {torch.cuda.is_available()}")
    output.append(f"torch.backends.cudnn.is_available(): {torch.backends.cudnn.is_available()}")
    output.append(f"torch.version.cuda: {torch.version.cuda}")
    output.append(f"torch.version.cudnn: {torch.backends.cudnn.version()}")

    return "\n".join(output)

def clean_temp_dirs():
    paths = [
        os.getenv("TEMP"),
        r"C:\Windows\Temp",
        r"C:\NVIDIA",
        r"C:\ProgramData\NVIDIA Corporation\Installer2"
    ]
    result = ""
    for path in paths:
        try:
            if os.path.exists(path):
                shutil.rmtree(path, ignore_errors=True)
                result += f"? 已清理：{path}\n"
            else:
                result += f"?? 路徑不存在：{path}\n"
        except Exception as e:
            result += f"? 清理失敗：{path}\n原因：{str(e)}\n"
    return result

# 建立 GUI
root = tk.Tk()
root.title("GPU 環境狀態 & 清理助手")
root.geometry("780x500")

output_text = scrolledtext.ScrolledText(root, wrap=tk.WORD, font=("Consolas", 10))
output_text.pack(padx=10, pady=10, fill=tk.BOTH, expand=True)

def run_check():
    output_text.delete(1.0, tk.END)
    output = check_env()
    output_text.insert(tk.END, output)

def run_cleanup():
    result = clean_temp_dirs()
    messagebox.showinfo("清理完成", result)

button_frame = tk.Frame(root)
button_frame.pack(pady=5)

tk.Button(button_frame, text="? 檢查 GPU 環境", command=run_check, width=30).grid(row=0, column=0, padx=10)
tk.Button(button_frame, text="?? 清理暫存垃圾", command=run_cleanup, width=30).grid(row=0, column=1, padx=10)

root.mainloop()
