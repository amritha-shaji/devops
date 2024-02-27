#!/bin/bash


read -p "Enter directory path: " directory


if [  -d "$directory" ]; then
    echo "directory exist"
 else 
    echo "directory does not exist"	 
fi

file_count=$(find "$directory" -maxdepth 1 -type f | wc -l)

# Print the number of files
echo "Number of files in $directory: $file_count"

