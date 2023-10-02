#!/bin/bash

# Check if the file containing usernames exists
usernames_file="usernames.txt"

if [ ! -f "$usernames_file" ]; then
    echo "The file '$usernames_file' does not exist."
    exit 1
fi

# Create a directory to store user folders if it doesn't already exist
mkdir -p user_directories

# Loop through each username in the file
while IFS= read -r username; do
    # Remove leading/trailing whitespace
    username=$(echo "$username" | tr -d '[:space:]')

    # Create a directory for the user
    user_directory="user_directories/$username"
    mkdir -p "$user_directory"

    # Generate a random password
    random_password=$(< /dev/urandom tr -dc A-Za-z0-9 | head -c12)
    
    # Create a .pass file and write the password to it
    pass_file="$user_directory/.pass"
    echo "$random_password" > "$pass_file"

    echo "User '$username' directory created with random password: $random_password"
done < "$usernames_file"

echo "User directories and .pass files have been created successfully."
