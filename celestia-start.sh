#!/bin/bash

# Function to start the app
start_app() {
    local appName=$1
    local port=$2
    cd /home/celestia
    # Start the app using bun and set the PORT environment variable
    PORT="$port" ~/.bun/bin/bun "apps/${appName}/server.js"
}

# Function to start the servers
start_servers() {
    local port=$1
    cd /home/celestia
    # Start the servers using bun and set the PORT environment variable
    PORT="$port" ~/.bun/bin/bun "servers/dist/src/main.js"
}

# Main script
while getopts "a:sp:" opt; do
    case ${opt} in
        a)
            appName=${OPTARG}
            start_app "${appName}" "${PORT:-3000}"  # Default port 3000 if not provided
            ;;
        s)
            start_servers "${PORT:-3000}"  # Default port 3000 if not provided
            ;;
        p)
            PORT=${OPTARG}
            ;;
        *)
            echo "Invalid option: -$OPTARG" >&2
            echo "Usage: $0 -a <appName> | -s [-p <port>]" >&2
            exit 1
            ;;
    esac
done

# If no option is provided, show usage
if [ $OPTIND -eq 1 ]; then
    echo "Usage: $0 -a <appName> | -s [-p <port>]" >&2
    exit 1
fi

# Keep the script running
wait
