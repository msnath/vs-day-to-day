import os
import random
import string

# Function to generate a random string
def generate_random_string(length=12):
    characters = string.ascii_letters + string.digits
    return ''.join(random.choice(characters) for _ in range(length))

# Path to the file containing usernames
usernames_file = "usernames.txt"

# Check if the file exists
if not os.path.exists(usernames_file):
    print(f"The file '{usernames_file}' does not exist.")
    exit(1)

# Create a directory to store user folders if it doesn't already exist
if not os.path.exists("user_directories"):
    os.mkdir("user_directories")

# Read the usernames from the file and process each one
with open(usernames_file, "r") as file:
    for username in file:
        # Clean up the username by removing leading/trailing whitespace
        username = username.strip()
        
        # Create a directory for each user
        user_directory = os.path.join("user_directories", username)
        os.mkdir(user_directory)

        # Generate a random password
        random_password = generate_random_string()

        # Create a .pass file and write the password to it
        pass_file_path = os.path.join(user_directory, ".pass")
        with open(pass_file_path, "w") as pass_file:
            pass_file.write(random_password)

        print(f"User '{username}' directory created with random password: {random_password}")

print("User directories and .pass files have been created successfully.")
