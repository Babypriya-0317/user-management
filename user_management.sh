#!/bin/bash

# ---- COLORS ----
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# ---- CONFIGURATION ----
LOG_FILE="/home/babypriyaa/user_management/logs/user_management.log"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# ---- LOG FUNCTION ----
log_action() {
    echo "[$DATE] $1" >> $LOG_FILE
}

# ---- MENU ----
show_menu() {
    echo -e "${BLUE}===============================${NC}"
    echo -e "${BLUE}   USER MANAGEMENT SYSTEM${NC}"
    echo -e "${BLUE}===============================${NC}"
    echo -e "${GREEN}1. Create User${NC}"
    echo -e "${GREEN}2. Delete User${NC}"
    echo -e "${GREEN}3. Add User to Group${NC}"
    echo -e "${GREEN}4. List All Users${NC}"
    echo -e "${GREEN}5. Check User Info${NC}"
    echo -e "${RED}6. Exit${NC}"
    echo -e "${BLUE}===============================${NC}"
    echo -e "${YELLOW}Enter your choice: ${NC}"
}

# ---- CREATE USER ----
create_user() {
    echo -e "${YELLOW}Enter username to create: ${NC}"
    read username
    if id "$username" &>/dev/null; then
        echo -e "${RED}User $username already exists!${NC}"
        log_action "FAILED - User $username already exists"
    else
        sudo useradd -m $username
        echo -e "${YELLOW}Enter password for $username: ${NC}"
        sudo passwd $username
        echo -e "${GREEN}✅ User $username created successfully!${NC}"
        log_action "SUCCESS - User $username created"
    fi
}

# ---- DELETE USER ----
delete_user() {
    echo -e "${YELLOW}Enter username to delete: ${NC}"
    read username
    if id "$username" &>/dev/null; then
        sudo userdel -r $username
        echo -e "${GREEN}✅ User $username deleted successfully!${NC}"
        log_action "SUCCESS - User $username deleted"
    else
        echo -e "${RED}User $username does not exist!${NC}"
        log_action "FAILED - User $username not found"
    fi
}

# ---- ADD USER TO GROUP ----
add_to_group() {
    echo -e "${YELLOW}Enter username: ${NC}"
    read username
    echo -e "${YELLOW}Enter group name: ${NC}"
    read groupname
    sudo usermod -aG $groupname $username
    echo -e "${GREEN}✅ User $username added to group $groupname!${NC}"
    log_action "SUCCESS - User $username added to group $groupname"
}

# ---- LIST ALL USERS ----
list_users() {
    echo -e "${BLUE}===============================${NC}"
    echo -e "${BLUE}All System Users:${NC}"
    echo -e "${BLUE}===============================${NC}"
    cat /etc/passwd | grep -v "nologin\|false" | cut -d: -f1
    log_action "INFO - Listed all users"
}

# ---- CHECK USER INFO ----
check_user() {
    echo -e "${YELLOW}Enter username to check: ${NC}"
    read username
    if id "$username" &>/dev/null; then
        echo -e "${GREEN}User Info for $username:${NC}"
        id $username
        echo -e "${GREEN}Groups: $(groups $username)${NC}"
        log_action "INFO - Checked user $username"
    else
        echo -e "${RED}User $username does not exist!${NC}"
    fi
}

# ---- MAIN LOOP ----
while true; do
    show_menu
    read choice
    case $choice in
        1) create_user ;;
        2) delete_user ;;
        3) add_to_group ;;
        4) list_users ;;
        5) check_user ;;
        6) echo -e "${RED}Exiting...${NC}"
           log_action "INFO - Script exited"
           exit 0 ;;
        *) echo -e "${RED}Invalid choice!${NC}" ;;
    esac
done
