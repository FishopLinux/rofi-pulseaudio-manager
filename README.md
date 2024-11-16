# **Rofi PulseAudio Manager**

A simple shell script to manage PulseAudio devices and volume controls easily through a Rofi-based interface.

## **Features**
- Switch between audio output devices (e.g., speakers, headphones).
- Switch between audio input devices (e.g., microphones).
- Adjust volume levels.
- Toggle mute/unmute.

---

## **Dependencies**
Ensure the following tools are installed on your system:
- [**PulseAudio**](https://www.freedesktop.org/wiki/Software/PulseAudio/): For managing audio devices.
- [**pulsemixer**](https://github.com/GeorgeFilipkin/pulsemixer): For easier audio control via the terminal.

---

## **Installation**

1. **Download the Script:**
   Download the `audio_manager.sh` script to a directory of your choice.

2. **Make it Executable:**
   ```bash
   chmod +x /path/to/audio_manager.sh
   ```

3. **Set Up a Shortcut (Optional):**
   If you're using a window manager like **i3**, you can bind the script to a key combination for quick access.

   **Example for i3:**
   Add the following to your i3 configuration file (`~/.config/i3/config` or similar):
   ```plaintext
   # Bind Rofi PulseAudio Manager to Mod + Shift + P
   bindsym $mod+Shift+p exec --no-startup-id "bash /path/to/audio_manager.sh"
   ```

4. **Reload i3 Configuration:**
   Apply the changes by reloading your i3 configuration:
   ```bash
   i3-msg reload
   ```

---

## **Usage**

Run the script directly:
```bash
bash /path/to/audio_manager.sh
```

Or use your configured keybinding to launch the Rofi interface.

---

## **Screenshot**
![screenshot](rofi-pulseaudio-manager.gif)


---

## **Contributions**
Contributions, issues, and feature requests are welcome! Feel free to open an issue or submit a pull request on the repository.
