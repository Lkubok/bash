#!/usr/bin/env bash

text_bold=$(tput bold)
text_success=$(tput setaf 2)
text_info=$(tput setaf 6)
text_reset=$(tput sgr0)

thumbnail_extension="thumbnail"
declare -i thumb_size=100

echo ""
echo -e "${text_info}Image thumbnail generator${text_reset} \n \n"

for file in *.{jpg,png,gif}; do
    # Check if file exists and have thumbnail
    file_with_thumbail_ext="${file%.*}.${thumbnail_extension}.${file##*.}"

    # Check if file really exists and has no thumbnail extension
    if [[ -f "${file}" && "${file}" != *"${thumbnail_extension}"* ]]; then

        # echo "${file##*.}"

        # Checking if image thumbnail already exists
        if [[ ! -f "${file_with_thumbail_ext}" ]]; then
            echo -n "File ${text_info}${file}${text_reset} has no ${text_bold}thumbnail${text_reset} "
            image_size=$(identify "${file}" | cut -d " " -f 3)
            declare -i image_width="${image_size##*x}"
            declare -i image_height="${image_size%%x*}"

            # Checking if there is a need to create thumbnail
            if ((image_height > thumb_size || image_width > thumb_size)); then
                printf "Creating... \n"
                convert ${file} -resize ${thumb_size}x${thumb_size} ${file_with_thumbail_ext}
                if [[ $? == 0 ]]; then
                    echo "Created ${text_success}${text_bold}${file_with_thumbail_ext}${text_reset}"
                fi
            else
                echo "${text_info}No need for thumbnail creation${text_reset}"
            fi

        else
            echo -n "${text_info}${file} has thumbnail already, aborting..${text_reset}"
            echo ""
        fi
    fi
done
