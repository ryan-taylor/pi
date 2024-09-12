# Raspberry Pi Scripts

This repository contains a collection of useful scripts I've created for Raspberry Pi 5. These tools are designed to enhance the functionality and ease of use.

## Table of Contents
1. [Display Control Script](#display-control-script)
3. [Installation](#installation)
4. [Usage](#usage)
5. [License](#license)

## Display Control Script

You don't always want a display on especially if you are ssh'd into the device for testing. This Display Control Script allows you to manage your Raspberry Pi's display *remotely, enabling you to turn it on and off via SSH or at boot time. This script was specifically designed for non-HDMI displays, particularly the Freenove 7 Inch Touchscreen Monitor, but may work with other non-HDMI displays as well.

*If you use it local, the screen will turn back on during reboot, unless you yourself are headless and can see your terminal prompt without a screen.

### Compatible Hardware

This script was primarily designed and tested with the following display:

- **Freenove 7 Inch Touchscreen Monitor for Raspberry Pi**
  - Resolution: 800x480 pixels
  - Display Type: IPS
  - Touch: 5-point capacitive touch
  - Connection: Raspberry Pi DISPLAY port (not HDMI)
  - Compatible with: Raspberry Pi 5, 4B, 3B+, 3B, 3A+, 2B, 1B+, 1A+

**Note:** This display does not have an HDMI port and is only compatible with certain models of Raspberry Pi.

### Features

- Turn display on and off remotely
- Automatically turn on display at boot
- Supports various backlight devices
- Easy to use with command-line arguments

### Requirements

- Raspberry Pi (compatible models listed above)
- Compatible non-HDMI display (e.g., Freenove 7 Inch Touchscreen Monitor)
- Bash shell
- Root access (for system service setup)

### Setup

1. Clone this repository:
   ```
   git clone https://github.com/ryan-taylor/pi.git
   cd pi/tools
   ```

2. Make the script executable:
   ```
   chmod +x display_control.sh
   ```

3. Set up the systemd service for automatic display on at boot:
   ```
   sudo cp display-on.service /etc/systemd/system/
   sudo systemctl enable display-on.service
   sudo systemctl start display-on.service
   ```

4. (Optional) Add an alias for easy use:
   Add the following line to your `~/.bashrc` file:
   ```
   alias display='/path/to/pi/tools/display_control.sh'
   ```
   Then reload your `.bashrc`:
   ```
   source ~/.bashrc
   ```

### Usage

- Turn off the display:
  ```
  ./display_control.sh off
  ```
  Or, if you've set up the alias:
  ```
  display off
  ```

- Turn on the display:
  ```
  ./display_control.sh on
  ```
  Or, with the alias:
  ```
  display on
  ```

- The display will automatically turn on at boot thanks to the systemd service.

### Troubleshooting

If you encounter issues:

1. Check the script permissions: `ls -l display_control.sh`
2. Verify the systemd service status: `sudo systemctl status display-on.service`
3. Check system logs: `sudo journalctl -xeu display-on.service`
4. If the display is not showing correctly, you may need to modify the Raspberry Pi's configuration file. Refer to the display's documentation for specific instructions.

If you need to modify the script, remember to reload the systemd daemon after changes:
```
sudo systemctl daemon-reload
sudo systemctl restart display-on.service
```

## Installation

To install all tools in this repository:

1. Clone the repository:
   ```
   git clone https://github.com/ryan-taylor/pi.git
   ```

2. Navigate to the tools directory:
   ```
   cd pi/tools
   ```

3. Make all scripts executable:
   ```
   chmod +x *.sh
   ```

4. Follow the specific setup instructions for each tool as described in their respective sections.

## Usage

Each tool in this repository has its own usage instructions. Please refer to the individual tool sections for detailed usage information.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

For any questions or issues, please open an issue in the GitHub repository. While this is a personal repo and not actively seeking contributions, I'm open to feedback and suggestions for improvements.
