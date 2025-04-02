# This code extracts matching rows.

# Display Processes for a Specific User
# - Displays only processes owned by the root user.
ps aux | awk '$1 == "root"'

# Retrieve Only the Process ID (PID)
# - Retrieves the PIDs of processes related to nginx.
ps aux | awk '/nginx/ {print $2}'

# Display Processes with a Specific CPU Usage or Higher
# - Displays processes where the CPU usage (%CPU column) is greater than 10%.
ps aux | awk '$3 > 10.0'

# Display Processes with a Specific Memory Usage or Higher
# - Displays processes where the memory usage (%MEM column) is greater than 5%.
ps aux | awk '$4 > 5.0'
