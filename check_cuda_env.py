
import torch

print("🔍 Checking PyTorch GPU Availability...")
print(f"PyTorch version: {torch.__version__}")
print(f"CUDA available: {torch.cuda.is_available()}")
if torch.cuda.is_available():
    print(f"CUDA version (runtime): {torch.version.cuda}")
    print(f"Device Count: {torch.cuda.device_count()}")
    print(f"Current GPU: {torch.cuda.get_device_name(torch.cuda.current_device())}")
    print(f"cuDNN enabled: {torch.backends.cudnn.enabled}")
else:
    print("⚠️ No GPU detected or driver mismatch.")

try:
    import tensorflow as tf
    print("\n🔍 Checking TensorFlow GPU Availability...")
    print(f"TensorFlow version: {tf.__version__}")
    print(f"TF GPU available: {tf.config.list_physical_devices('GPU')}")
except ImportError:
    print("\n⚠️ TensorFlow not installed. Skipping TF check.")
