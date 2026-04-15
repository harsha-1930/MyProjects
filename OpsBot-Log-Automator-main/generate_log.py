import random
from datetime import datetime, timedelta

# Define possible log messages
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

# Start time for logs
start_time = datetime.now() - timedelta(days=1)

# Create a log file with 5000 lines
with open("server.log", "w") as f:
    for i in range(5000):
        # Increment timestamp by random seconds
        timestamp = start_time + timedelta(seconds=i * random.randint(1, 5))
        log_entry = f"{timestamp.strftime('%Y-%m-%d %H:%M:%S')} {random.choice(log_messages)}"
        f.write(log_entry + "\n")

print("server.log created with 5000 realistic timestamped lines.")