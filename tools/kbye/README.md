cat << 'EOF' > README.md
# Kbye - Raspberry Pi Shutdown Tool

This tool provides a simple way to safely shut down a Raspberry Pi using a custom 'kbye' command.

## Components:
1. `shutdown_script.py`: The main Python script that monitors for a shutdown flag.
2. `shutdown_script.service`: A systemd service file to run the script as a background service.
3. `kbye`: A bash script that triggers the shutdown process.

## Installation:
1. Copy `shutdown_script.py` to `/home/$USER/`
2. Copy `shutdown_script.service` to `/etc/systemd/system/`
3. Copy `kbye` to `/usr/local/bin/` and make it executable:
sudo chmod +x /usr/local/bin/kbye

4. Enable and start the service:
sudo systemctl daemon-reload
sudo systemctl enable shutdown_script.service
sudo systemctl start shutdown_script.service

## Usage:
To shut down the Raspberry Pi, simply type `kbye` in the terminal from any directory.

## Troubleshooting:
If issues occur, check the log file at `/home/rt/shutdown_log.txt` for any error messages or unexpected behavior.
EOF
