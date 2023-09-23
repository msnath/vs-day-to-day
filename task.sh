#!/bin/bash

# Specify the directory where you want to create the files
directory="files_directory"

# Create the directory if it doesn't exist
mkdir -p "$directory"

# Loop to create and write to 100 files
for i in {1..100}; do
    filename="$directory/file$i.txt"
    content="hello world$i"
    echo "$content" > "$filename"
    echo "Created $filename with content: $content"
done

echo "All files created successfully in $directory."