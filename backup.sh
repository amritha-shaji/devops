#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root or with sudo privileges."
    exit 1
fi

# Check if the username is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

# Define the username to be backed up
username=$1

# Check if the user exists
if id "$username" &>/dev/null; then
    # Set the backup destination directory
    backup_dir="/backup"
    
    # Create the backup directory if it doesn't exist
    mkdir -p "$backup_dir"
    
    # Generate a timestamp for the backup file
    timestamp=$(date +"%Y%m%d%H%M%S")
    
    # Create the backup file with the username and timestamp
    backup_file="$backup_dir/${username}_backup_$timestamp.tar.gz"
    
    # Archive the user's home directory and compress it
    tar -czvf "$backup_file" -C "/home/$username" .
    
    echo "Backup for user $username created at $backup_file"
else
    echo "User $username does not exist."
    exit 1
fi

