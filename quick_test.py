import torch
import tensorflow as tf

print("Torch available:", torch.cuda.is_available())
print("Torch device:", torch.cuda.get_device_name(0) if torch.cuda.is_available() else "None")

print("\nTensorFlow GPU devices:")
print(tf.config.list_physical_devices('GPU'))