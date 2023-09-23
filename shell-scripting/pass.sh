#!/bin/bash

# Step 1: Create a file with usernames
echo "user1" > usernames.txt
echo "user2" >> usernames.txt
echo "user3" >> usernames.txt
# Add more usernames as needed

# Step 2: Read the file to obtain usernames and create directories
while IFS= read -r username; do
    user_directory="users/$username"
    mkdir -p "$user_directory"

    # Step 3: Create a .pass file with a random string
    random_password=$(openssl rand -base64 12)
    echo "$random_password" > "$user_directory/.pass"
    
    echo "Created user directory for $username with random password: $random_password"
done < usernames.txt

# Cleanup: Remove the usernames file
rm usernames.txt