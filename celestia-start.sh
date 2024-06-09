#!/bin/bash

# Function to start the app
start_app() {
    local appName=$1
    cd /home/celestia
    # Start the app using bun and keep the script running
    ~/.bun/bin/bun "apps/${appName}/server.js"
}

# Function to start the servers
start_servers() {
    cd /home/celestia
    # Start the servers using bun and keep the script running
    ~/.bun/bin/bun "servers/dist/src/main.js"
}

# Main script
while getopts "a:s" opt; do
    case ${opt} in
        a)
            appName=${OPTARG}
            start_app "${appName}"
            ;;
        s)
            start_servers
            ;;
        *)
            echo "Invalid option: -$OPTARG" >&2
            echo "Usage: $0 -a <appName> | -s" >&2
            exit 1
            ;;
    esac
done

# If no option is provided, show usage
if [ $OPTIND -eq 1 ]; then
    echo "Usage: $0 -a <appName> | -s" >&2
    exit 1
fi

# Keep the script running
wait
