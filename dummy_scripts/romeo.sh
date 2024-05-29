#!/usr/bin/env bash

echo "$(tput bold)$(tput setaf 1)Love analiser <3 $(tput sgr0)"
echo " "
echo "Checking if file romeo.txt exists.."
echo "------"

declare -r filename="romeo.txt"

if [[ -f "${filename}" ]]; then
    echo -e "File exists, skipping download \n"
else
    echo "Downloading file.."
    wget -q 'https://downloads.codingcoursestv.eu/055%20-%20bash/if/romeo.txt'
    if [[ $? -eq 0 ]]; then
        echo "Download copleted"
    else
        echo "Download failed :((( " >&2
        exit 1
    fi
fi

occured="$(cat $filename | grep -c "love")"

echo "Word $(tput setaf 1)$(tput bold)love$(tput sgr0) occured ${occured} times"
exit 0
