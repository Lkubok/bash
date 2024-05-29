#!/usr/bin/env bash

# Find script working directory
script_directory=$(dirname -- "${BASH_SOURCE[0]}")

images_url="https://downloads.codingcoursestv.eu/055%20-%20bash/while/images/"
write_directory="bulk_images"
declare -i image_counter=1
declare -i fail_counter=0
declare -i success_counter=0

text_bold=$(tput bold)
text_error=$(tput setaf 1)
text_success=$(tput setaf 2)
text_reset=$(tput sgr0)

echo -e "Downloading bulk images for thumbnails.. \n "
echo ""
echo "Checking if folder to write exists.."

# Checking for writeable directory
if [ -d "${write_directory}" ]; then
    echo "${write_directory} does exist."
else
    echo "Wire directory does not exist. Creating ${text_bold}${text_success}${write_directory}${text_reset}"
    mkdir "${script_directory}/${write_directory}"
fi

while ((image_counter <= 4)); do
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
    if ((fail_counter >= 10)); then
        echo "More that ${fail_counter} images failed to download, aborting fetching of images"
        break
    fi
done
