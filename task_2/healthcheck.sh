#!/bin/bash

# Define a function to check the system's CPU usage
check_cpu_usage() {
  cpu_usage=$(top -bn1 | awk '/Cpu\(s\)/ {print $2}' | awk -F. '{print $1}')
  echo "CPU Usage: $cpu_usage%"
  if (("$cpu_usage > 80" | bc)); then
        echo "high CPU usage detected..."
  fi
}

# Define a function to check the system's memory usage
check_memory_usage() {
  memory_usage=$(free -m | awk '/Mem:/ {print $3/$2 * 100}' | awk -F. '{print $1}')
  echo "Memory Usage: $memory_usage%"
  if (("$memory_usage < 20" | bc -l)); then
        echo "Low memory available....."
  fi
}

# Define a function to check the system's disk usage
check_disk_usage() {
  disk_usage=$(df -h / | awk '/\// {print $5}' | sed 's/%//g')
  echo "Disk Usage: $disk_usage%"
}

# Define a function to check the system's uptime
check_uptime() {
  uptime=$(uptime | awk '{print $3,$4}')
  echo "Uptime: $uptime"
}

# Define a function to check the system's running processes
check_running_processes() {
  running_processes=$(ps -ef | wc -l)
  echo "Running Processes: $running_processes"
}

# Call the functions to perform the system health check
echo "System Health Check Completed Successfully ........!"
echo "For details goto the system_health.log file."

echo "System Health Check:" >> system_health.log
echo "-------------------" >> system_health.log
check_cpu_usage >> system_health.log
check_memory_usage >> system_health.log
check_disk_usage >> system_health.log
check_uptime >> system_health.log
check_running_processes >> system_health.log
