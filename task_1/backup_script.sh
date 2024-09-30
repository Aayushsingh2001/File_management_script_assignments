#!/bin/bash

# Current directory where .txt files are stored.
current_directory="/c/Users/as699/onedrive/desktop/aayu_devops/assignment_file_management_script/task_1/current_directory"

# Backup directory where after the backup .txt file store.
backup="/c/Users/as699/onedrive/desktop/aayu_devops/assignment_file_management_script/task_1/backup"

# Get the current date and time in a specific format
current_datetime=$(date +"%Y0-%m-%d >> %H:%M:%S")

#make a directory when directory is not exist.
mkdir -p "$backup"

# Copy .txt files to current directory to backup
cp "$current_directory"/*.txt "$backup"

# Printing the current location, backup location and date & time 
echo "current file directory is: $current_directry"
echo "backup completed.....!"
echo "after the backup file location is: $backup"
echo "current backup timing is: $current_datetime"

