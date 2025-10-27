#!/bin/bash

# Simple watch command replacement for macOS
# Usage: watch.sh [-n interval] <command>

INTERVAL=2

# Parse options
while getopts "n:" opt; do
    case $opt in
        n)
            INTERVAL=$OPTARG
            ;;
        \?)
            echo "Usage: $0 [-n interval] <command>"
            echo "Default interval is 2 seconds"
            exit 1
            ;;
    esac
done

shift $((OPTIND-1))

if [ -z "$1" ]; then
    echo "Usage: $0 [-n interval] <command>"
    echo "Default interval is 2 seconds"
    exit 1
fi

while true; do
    clear
    date
    echo "Every ${INTERVAL}s: $*"
    echo "-------------------------"
    eval "$*"
    echo "-------------------------"
    sleep "$INTERVAL"
done
