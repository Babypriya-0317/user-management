# User Management Automation

## Description
A bash script that automates Linux user management
with an interactive colorful menu interface.

## Features
- Create new users with password
- Delete existing users
- Add users to groups
- List all system users
- Check user information
- Activity logging with timestamp
- Color coded terminal interface

## Technologies Used
- Linux (Ubuntu)
- Bash Scripting
- useradd, userdel, usermod
- passwd, id, groups
- /etc/passwd

## Project Structure
user_management/
├── user_management.sh  # Main script
├── README.md           # Documentation
└── logs/               # Activity logs

## How to Run
# Clone the repo
git clone https://github.com/Babypriya-0317/user-management

# Give permission
chmod +x user_management.sh

# Run the script
bash user_management.sh

## Remote Deployment
This project can be deployed on a remote Linux server.
- Use **PuTTY** to SSH into the remote server
  ssh username@server-ip
- Use **WinSCP** to transfer user_management.sh to server
- Then run the script on the server
  bash user_management.sh

## Sample Output
===============================
   USER MANAGEMENT SYSTEM
===============================
1. Create User
2. Delete User
3. Add User to Group
4. List All Users
5. Check User Info
6. Exit
===============================
