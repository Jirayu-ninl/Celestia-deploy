#!/bin/bash

# Function to start the app
start_app() {
    local app_name=$1
    local port=$2
    cd /home/celestia || { echo "Failed to navigate to /home/celestia"; exit 1; }
    # Start the app using bun and set the PORT environment variable
    PORT="$port" /home/ubuntu/.bun/bin/bun "${app_name}/server.js" &
    echo "Started app: ${app_name} on port: ${port}"
}

# Main script
app_name=""
port="3000"
while getopts ":a:p:" opt; do
    case ${opt} in
        a)
            app_name=${OPTARG}
            ;;
        p)
            port=${OPTARG}
            ;;
        ?)
            echo "Invalid option: -$OPTARG" >&2
            echo "Usage: $0 -a <app_name> [-p <port>]" >&2
            exit 1
            ;;
    esac
done

# If no option is provided, show usage
if [ $OPTIND -eq 1 ]; then
    echo "Usage: $0 -a <app_name> | -s [-p <port>]" >&2
    exit 1
fi

# Start app based on options
if [ -n "$app_name" ]; then
    start_app "$app_name" "$port"
else
    echo "No valid action specified." >&2
    echo "Usage: $0 -a <app_name> [-p <port>]" >&2
    exit 1
fi

# Keep the script running to keep background processes alive
wait