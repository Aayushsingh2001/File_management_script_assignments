#!/bin/bash

# Function to compress a directory
compress_directory() {
    local directory_path="$1"
    
    # Check if the provided path is a directory
    if [ ! -d "$directory_path" ]; then
        echo "Error: '$directory_path' is not a valid directory."
        return 1
    fi

    # Get the current date in YYYY-MM-DD format
    local current_date=$(date +%Y-%m-%d)
    
    # Create the name for the compressed file
    local compressed_file_name="backup_${current_date}.tar.gz"
    
    # Compress the directory
    tar -czf "$compressed_file_name" -C "$(dirname "$directory_path")" "$(basename "$directory_path")"
    
    echo "Successfully compressed '$directory_path' to '$compressed_file_name'"
}

# Prompt the user for the directory path
read -p "Enter the directory path to compress: " directory_path
compress_directory "$directory_path"

