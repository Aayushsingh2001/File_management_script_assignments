#!/bin/bash

# Create a backup directory in the user's home directory
current_directory="/c/Users/as699/onedrive/desktop/aayu_devops/assignment_file_management_script/task_1/current_directory"

# Create the directory if it doesn't exist
backup="/c/Users/as699/onedrive/desktop/aayu_devops/assignment_file_management_script/task_1/backup"

# Get the current date and time in a specific format
current_datetime=$(date +"%Y0-%m-%d >> %H:%M:%S")

mkdir -p "$backup"

# Copy .txt files
cp "$current_directory"/*.txt "$backup"

echo "current file directory is: $current_directry"
echo "backup completed.....!"
echo "after the backup file location is: $backup"
echo "current backup timing is: $current_datetime"

