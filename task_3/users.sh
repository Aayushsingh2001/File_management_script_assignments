#!/bin/bash

# Check if user_list.txt exists
if [[ ! -f user_list.txt ]]; then
    echo "User list file 'user_list.txt' not found!"
    exit 1
fi

# Output file for credentials
credentials_file="credentials.txt"
> "$credentials_file"  # Clear the file if it exists

# Read usernames from the file
while IFS= read -r username; do
    # Check if username is not empty
    if [[ -z "$username" ]]; then
        continue
    fi

    # Generate a random password
    password=$(openssl rand -base64 12)

    # Create the user
    if sudo useradd -m "$username"; then
        # Set the user's password
        echo "$username:$password" | sudo chpasswd
        
        # Save username and password to the credentials file
        echo "Username: $username, Password: $password" >> "$credentials_file"
        echo "User '$username' created successfully."
    else
        echo "Failed to create user '$username'."
    fi
done < user_list.txt

echo "Credentials saved to '$credentials_file'."

