#!/bin/bash

DIRECTORY="$1"
RECURSIVE=false
# SIGINT
ctrl_c() {
    echo -e "\nScript exited by user with 'Ctrl+C'.."
    exit 1
}
trap ctrl_c SIGINT
# Check for recursive option
if [ "$2" = "-r" ] || [ "$2" = "--recursive" ]; then
    RECURSIVE=true
fi

if [ -z "$DIRECTORY" ]; then
    echo "Usage: $0 [directory] [-r|--recursive]"
    exit 1
fi

if [ ! -d "$DIRECTORY" ]; then
    echo "Error: $DIRECTORY is not a directory"
    exit 2
fi
# List dir contents
OPTIONS="-C"  # Enable color output

if [ "$RECURSIVE" = false ]; then
    OPTIONS="$OPTIONS -L 1"  # Limit depth
fi
# Run tree command
tree $OPTIONS "$DIRECTORY"
