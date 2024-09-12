cat << 'EOF' > shutdown_script.py
#!/usr/bin/env python3
import os
import time

def shutdown():
    with open('/home/rt/shutdown_log.txt', 'a') as log:
        log.write(f"{time.ctime()}: Shutting down...\n")
    os.system("sudo shutdown now")

def check_shutdown_flag():
    try:
        with open('/home/rt/shutdown_flag.txt', 'r') as flag_file:
            return flag_file.read().strip().lower() == 'kbye'
    except FileNotFoundError:
        return False

with open('/home/rt/shutdown_log.txt', 'a') as log:
    log.write(f"{time.ctime()}: Script started\n")

while True:
    if check_shutdown_flag():
        shutdown()
    time.sleep(1)
EOF
