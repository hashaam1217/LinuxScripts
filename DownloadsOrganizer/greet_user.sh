#!/bin/bash
# My Awesome Greeting Script

# Define a function to display a friendly greeting
greet_user() {
    local username="$1"
    echo "Hello, $username! Welcome to the world of Bash scripting."
}

# Main script starts here
if [ $# -eq 0 ]; then
    echo "Usage: $0 <your_name>"
    exit 1
fi

user_name="$1"
greet_user "$user_name"

