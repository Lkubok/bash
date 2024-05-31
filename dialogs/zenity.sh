#!/bin/sh

if zenity --entry \
    --title="Add new profile" \
    --text="Enter name of new profile:" \
    --entry-text "NewProfile"; then
    echo $?
else
    echo "No name entered"
fi
