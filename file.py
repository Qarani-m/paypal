from Crypto.Cipher import AES
from base64 import b64decode

key = b"your_encryption_key"
iv = b"your_initialization_vector"
cipher = AES.new(key, AES.MODE_CBC, iv)

# Replace the string with your encrypted data
encrypted_data = b64decode("your_encrypted_string_here")
decrypted_data = cipher.decrypt(encrypted_data)
print(decrypted_data.decode("utf-8"))
