#!/usr/bin/env bash

# Find script working directory
script_directory=$(dirname -- "${BASH_SOURCE[0]}")

images_url="https://downloads.codingcoursestv.eu/055%20-%20bash/while/images/"
write_directory="bulk_images"
declare -i image_counter=1
declare -i fail_counter=0
declare -i success_counter=0
declare -r image_fetch_limit=100
declare -r image_fetch_error_limit=10

text_bold=$(tput bold)
text_error=$(tput setaf 1)
text_success=$(tput setaf 2)
text_info=$(tput setaf 6)
text_reset=$(tput sgr0)

echo -e "${text_info}Downloading bulk images for thumbnails.. \n ${text_reset}"
echo ""
echo "Checking if folder to write exists.."

# Checking for writeable directory
if [ -d "${script_directory}/${write_directory}" ]; then
    echo "${text_info}${write_directory}${text_reset} does exist"
    echo ""
else
    echo "Write directory does not exist. Creating ${text_bold}${text_success}${write_directory}${text_reset}"
    mkdir "${script_directory}/${write_directory}"
    echo ""
fi

while ((image_counter <= image_fetch_limit)); do
    echo -n "Downloading ${image_counter} image..  "
    curl "${images_url}image-${image_counter}.jpg" -o "${script_directory}/${write_directory}/image-${image_counter}.jpg" -f -s

    # Checking the result of current fetch
    if [[ $? != 0 ]]; then
        ((fail_counter = fail_counter + 1))
        echo "${text_error}Image ${image_counter} failed to download${text_reset}"
    else
        echo "Successfully fetched image ${text_bold}${text_success}${image_counter}${text_reset}"
        ((success_counter = success_counter + 1))
    fi

    # Attempting to download next image
    ((image_counter = image_counter + 1))

    # Exit after 10 failed attempts
    if ((fail_counter >= image_fetch_error_limit)); then
        echo "${text_error}More than ${text_bold}${fail_counter}${text_reset}${text_error} images failed to download, aborting fetching of images${text_reset}" >&2
        break
        exit 1
    fi
done
