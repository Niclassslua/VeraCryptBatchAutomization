# 🔐 VeraCryptBatchAutomization

<img width="200" alt="image" src="https://github.com/user-attachments/assets/09cbac34-14ae-438f-8a3a-f2dc81c9f179">

<br>
<br>

This small batch script automates the decryption of a hard disk directly after boot and restarts the `explorer.exe` task to, for example, display the desktop or refresh the taskbar.

### 🚀 Features:
- Automatically mounts a VeraCrypt-encrypted volume after logging in.
- Optionally checks if the Desktop is located on the encrypted volume, ensuring that `explorer.exe` only restarts once the Desktop is available.
- Configurable drive and partition settings for flexibility.
- Skips the Desktop check if not required, making it adaptable for different setups.

---

## 💡 How to Install:

1. **Move the `run.bat` to your desired location.**

2. **Open Windows Task Scheduler**:
   - You can find it by searching "Task Scheduler" in the Windows Start menu.

3. **Create a New Task**:
   - Click "Create Task" in the right panel.

4. **Name the Task**:
   - Give the task any name you prefer, such as "VeraCrypt Auto-Mount".

5. **Set the Trigger**:
   - Under the "Triggers" tab, click "New" and set it to trigger "At log on."

6. **Skip Action**:
   - Since the batch script handles everything, you don't need to specify any actions here.

7. **Point to the Script**:
   - Under the "Actions" tab, click "New" and select "Start a Program."
   - Browse to the location where you saved the `run.bat` script and select it.

8. **Optional: Adjust Task Settings**:
   - You may also want to set the task to **run with highest privileges** to ensure it can properly access the VeraCrypt executable.

---

## 🔧 Configuration:

The script contains several configuration options that allow you to customize it for your specific setup. You will need to define the encrypted volume, the drive letter to assign, and whether the Desktop is stored on the encrypted drive.

### Edit the following lines in `run.bat`:

1. **Drive Letter**:
   ```batch
   SET mountdrive=a
   ```
   - Set this to the **drive letter** that you want to assign to the mounted VeraCrypt volume (e.g., `z`, `e`, `f`, etc.).

2. **Volume/Partition Path**:
   ```batch
   SET volumename=\Device\Harddisk1\Partition1
   ```
   - Update this with the **correct volume or partition** that contains your encrypted data. You can find the correct volume by opening VeraCrypt and selecting your encrypted partition.

3. **Check for Desktop**:
   ```batch
   SET desktop_on_encrypted_drive=true
   ```
   - Set this to `true` if your Desktop is stored on the encrypted drive. This ensures that the script waits for the drive to be decrypted and mounted before restarting `explorer.exe`.
   - Set it to `false` if your Desktop is **not** stored on the encrypted drive. This will skip the Desktop check and immediately proceed to restart `explorer.exe` after decryption.

### Example Configuration:
```batch
SET mountdrive=z
SET volumename=\Device\Harddisk2\Partition2
SET desktop_on_encrypted_drive=true
```

- This example mounts the encrypted partition `\Device\Harddisk2\Partition2` to drive letter `Z:` and checks if the Desktop is located on that volume before restarting the `explorer.exe` process.

---

## 📌 Notes:

- Ensure that VeraCrypt is installed and accessible via the `%PROGRAMFILES%` path, as the script relies on it to mount the encrypted volume.
- This script is designed for users who need their Desktop or taskbar refreshed after mounting an encrypted drive, but can be adapted for other purposes.
