import os
import random
import re
from datetime import datetime, timedelta

#Step 1: Generate a realistic log file
log_messages = [
    "INFO: Server started successfully",
    "INFO: User logged in",
    "ERROR: Disk space low",
    "CRITICAL: Database connection lost",
    "FAILED LOGIN: Attempt from 192.168.1.10",
    "INFO: Scheduled backup completed",
    "ERROR: Memory usage exceeded threshold",
    "CRITICAL: Firewall breach detected",
    "FAILED LOGIN: Attempt from 10.0.0.5"
]

start_time = datetime.now() - timedelta(days=1)

with open("server.log", "w") as f:
    for i in range(5000):
        timestamp = start_time + timedelta(seconds=i * random.randint(1, 5))
        log_entry = f"{timestamp.strftime('%Y-%m-%d %H:%M:%S')} {random.choice(log_messages)}"
        f.write(log_entry + "\n")

print("server.log created with 5000 realistic timestamped lines.")

# Step 2: Parse and filter logs
keywords = ["CRITICAL", "ERROR", "FAILED LOGIN"]
alerts = []
counts = {key: 0 for key in keywords}

with open("server.log", "r") as f:
    lines = f.readlines()

for line in lines:
    for key in keywords:
        if key in line.upper():
            alerts.append(line.strip())
            counts[key] += 1

#Generate security alert report 
date_str = datetime.now().strftime("%Y-%m-%d")
alert_file = f"security_alert_{date_str}.txt"

with open(alert_file, "w") as f:
    f.write("Security Alert Summary\n")
    f.write("======================\n\n")
    for key, count in counts.items():
        f.write(f"{key}: {count}\n")
    f.write("\n--- Detailed Alerts ---\n")
    for alert in alerts:
        f.write(alert + "\n")

#  Automation 
file_size = os.path.getsize(alert_file)
print(f"Security alert file '{alert_file}' created. Size: {file_size} bytes")