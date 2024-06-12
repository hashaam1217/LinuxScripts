#!/bin/bash
# Downloads Organizer Script
#
# TODO: Documentation
# TODO: Takes a Directory as input
# TODO: Verifies it's valid, creates neccessary folders
#
# exit codes
# 0 = successful
# 1 = Debug error / general error
# 2 = Input error


move_contents() {
    local directory="$0"
    local suffix="$1"
    cd $directory
    mkdir -p "$directory/$suffix"

    for FILE in *; do
        if [ -e "$FILE" ]; then
            mv "$FILE" "$suffix"
        else
            echo "No files found."
        fi
    done
}

# Input verification
# Edge case: no input
if [ $# -eq 0 ]; then
    echo "Usage: $0 <directory>"
    exit 2
fi

# Edge case: directory does not exist/invalid
if [ ! -d $1 ]; then
    echo "Directory invalid: $1"
    exit 2
fi


# Format for move_contents
cd $1
move_contents $1 "Downloads"

exit 0

