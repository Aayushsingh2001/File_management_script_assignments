#!/bin/bash

# Define the package file and log file
PACKAGE_FILE="packages.txt"
LOG_FILE="installation_log.txt"

# Check if the package file exists
if [ ! -f "$PACKAGE_FILE" ]; then
    echo "Error: Package file '$PACKAGE_FILE' not found!"
    exit 1
fi

# Clear the log file
> "$LOG_FILE"

# Function to install packages using apt
install_with_apt() {
    for package in "$@"; do
        if sudo apt-get install -y "$package"; then
            echo "$(date): Successfully installed '$package'" >> "$LOG_FILE"
        else
            echo "$(date): Failed to install '$package'" >> "$LOG_FILE"
        fi
    done
}

# Function to install packages using yum
install_with_yum() {
    for package in "$@"; do
        if sudo yum install -y "$package"; then
            echo "$(date): Successfully installed '$package'" >> "$LOG_FILE"
        else
            echo "$(date): Failed to install '$package'" >> "$LOG_FILE"
        fi
    done
}

# Detect the package manager
if command -v apt-get > /dev/null; then
    echo "Using apt to install packages."
    while read -r package; do
        install_with_apt "$package"
    done < "$PACKAGE_FILE"
elif command -v yum > /dev/null; then
    echo "Using yum to install packages."
    while read -r package; do
        install_with_yum "$package"
    done < "$PACKAGE_FILE"
else
    echo "Error: No supported package manager found (apt or yum)."
    exit 1
fi

echo "Installation completed. Check '$LOG_FILE' for details."

