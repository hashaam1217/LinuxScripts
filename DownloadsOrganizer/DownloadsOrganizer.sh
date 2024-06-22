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
    local directory="$1"
    local suffix="$2"
    local EXTENSION_ARRAY="$3"

    #echo "$directory/$suffix"
    mkdir -p "$directory/$suffix"

    echo "Printing extensions"
    for EXTENSION2 in ${EXTENSION_ARRAY[@]}; do
        echo "$EXTENSION2"
    done

    for FILE in *; do
        if [ ! -e "$FILE" ]; then
            echo "No files found."
            rmdir "$directory/$suffix"

        else
            for EXTENSION in "${EXTENSION_ARRAY[@]}"; do
                echo "Working on: $FILE"
                echo "    Testing against: $EXTENSION"
                if [[ $FILE == *"$EXTENSION"* ]]; then
                    echo "        Match Found"
                    mv "./$FILE" "$suffix"

                else
                    echo "$FILE Does not match extension"
                fi
            done
        fi
    done
}

# File extensions
PHOTO_EXTENSIONS=(".jpg" ".jpeg" ".png" ".gif" ".svg")
VIDEO_EXTENSIONS=(".mp4" ".mkv" ".avi")
DOCUMENT_EXTENSIONS=(".pdf" ".docx" ".odt" ".doc" ".html" ".htm")
ARCHIVES_EXTENSIONS=(".zip" ".rar" ".tar" ".tar.gz")
SCRIPTS_EXTENSIONS=(".sh" ".py" ".cpp" ".c" )
APP_EXTENSIONS=(".deb" ".rpm" ".AppImage")

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
move_contents $PWD Videos $VIDEO_EXTENSIONS

exit 0

