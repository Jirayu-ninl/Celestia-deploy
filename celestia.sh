#!/bin/bash

# Function to prompt for project name
get_project_name() {
    read -p "Enter the project name: " projectName
}

# Function to install or update 7z
install_or_update_7z() {
    sudo apt-get update
    sudo apt-get install -y p7zip-full
}

# Function to setup the environment
setup_environment() {
    cd /home
    sudo mkdir -p celestia
    sudo chown $USER:$USER celestia
    sudo chmod 777 celestia
    cd celestia

    # Create .env file
    echo "Enter the content for .env file (Press Ctrl+D to finish):"
    cat > .env
}

# Function to clean directories
clean_directories() {
    cd /home/celestia
    echo "Select a clean option:"
    echo "1. Clean app"
    echo "2. Clean server"
    echo "3. Clean all"
    read -p "Enter your choice (1-3): " clean_choice

    case $clean_choice in
        1) rm -rf "apps/${projectName}";;
        2) rm -rf server;;
        3) 
            rm -rf "apps/${projectName}"
            rm -rf server
            rm -rf node_modules
            rm -rf packages
            rm -f package.json
            ;;
        *) echo "Invalid choice";;
    esac
}

# Function to install app
install_app() {
    cd /home/celestia
    rm -rf "apps/${projectName}"
    rm -rf "app-${projectName}.7z"
    sudo mv "/home/theiceji.com/app-${projectName}.7z" "celestia/app-${projectName}.7z"
    cd celestia
    7z x "app-${projectName}.7z"
    cp .env "apps/${projectName}/.env"

    # Prompt for PORT
    read -p "Enter the PORT number: " PORT
    echo "PORT=${PORT}" >> "apps/${projectName}/.env"
}

# Function to install servers
install_servers() {
    cd /home/celestia
    rm -rf servers
    rm -rf "servers.7z"
    sudo mv "/home/theiceji.com/servers.7z" "celestia/servers.7z"
    cd celestia
    7z x "servers.7z" -oservers
    cp .env "servers/.env"
}

# Main script
if [[ "$1" == "--init" ]]; then
    install_or_update_7z
    setup_environment
    exit 0
fi

get_project_name

echo "Select an action:"
echo "1. Clean"
echo "2. Install App"
echo "3. Install Servers"
read -p "Enter your choice (1-3): " main_choice

case $main_choice in
    1) clean_directories;;
    2) install_app;;
    3) install_servers;;
    *) echo "Invalid choice";;
esac

echo "### DONE ###"
read -n 1 -s -r -p "Press any key to exit ..."
exit
