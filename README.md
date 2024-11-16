# **A Collection of Useful Modules or Scripts for Rofi**

This repository contains a variety of simple shell scripts designed to manage system settings through a Rofi-based interface. It includes modules for managing PulseAudio devices, controlling volume, switching networks, and more.

---

## **Features**

### Audio Management:
- Switch between audio output devices (e.g., speakers, headphones).
- Switch between audio input devices (e.g., microphones).
- Adjust volume levels.
- Toggle mute/unmute.

### Network Management:
- List available Wi-Fi networks.
- Connect to Wi-Fi networks.
- Disconnect from the current Wi-Fi network.
- Show network status (connected/disconnected).
- Enable or disable the network interface (e.g., Wi-Fi card).

---

## **Dependencies**
Ensure the following tools are installed on your system:

- [**PulseAudio**](https://www.freedesktop.org/wiki/Software/PulseAudio/): For managing audio devices.
- [**nmcli**](https://man7.org/linux/man-pages/man1/nmcli.1.html): Command-line client for managing network connections via NetworkManager.
- [**rofi**](https://github.com/davatorium/rofi): A window switcher, application launcher, and dmenu replacement for creating interactive menus.
- [**notify-send**](https://man7.org/linux/man-pages/man1/notify-send.1.html): For sending desktop notifications.

---

## **Installation**

1. **Download the Scripts:**
   Download the `audio_manager.sh` and `network_manager.sh` scripts to a directory of your choice.

2. **Make Them Executable:**
   ```bash
   chmod +x /path/to/audio_manager.sh
   chmod +x /path/to/network_manager.sh
   ```

3. **Set Up Shortcuts (Optional):**
   If you're using a window manager like **i3**, you can bind the scripts to key combinations for quick access.

   **Example for i3 (for both scripts):**
   Add the following to your i3 configuration file (`~/.config/i3/config` or similar):
   ```plaintext
   # Bind Rofi Audio Manager to Mod + Shift + A
   bindsym $mod+Shift+a exec --no-startup-id "bash /path/to/audio_manager.sh"
   
   # Bind Rofi Network Manager to Mod + Shift + N
   bindsym $mod+Shift+n exec --no-startup-id "bash /path/to/network_manager.sh"
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

Or launch the network manager:
```bash
bash /path/to/network_manager.sh
```

Alternatively, use your configured keybindings to launch the Rofi interface for audio and network management.

---

## **Screenshot**

### Audio Manager:
![screenshot](rofi-pulseaudio-manager.gif)
