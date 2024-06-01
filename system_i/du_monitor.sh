#!/usr/bin/env bash

# Disk usage in working directory

text_bold="$(tput bold)"
text_blue="$(tput setaf 6)"
text_reset="$(tput sgr0)"

size_treshold_in_mb=1

printf "\n"
echo "${text_bold}${text_blue}Disk monitor utility: ${text_reset}"
echo "Info: showing directiories only greater than treshold: ${text_blue}${text_bold}${size_treshold_in_mb}MB${text_reset}"
echo "--------------------------"
printf "\n"

directories_to_scan=$(ls -la | grep "^d" | awk '{ print $NF }')
readarray -t -s 2 directories < <(echo "${directories_to_scan}")

get_du_output() {
    for dir in "${directories[@]}"; do
        dir_size=$(du -shm "${dir}" 2>/dev/null | cut -d$'\t' -f 1)
        if [[ $dir_size -gt $size_treshold_in_mb ]]; then
            echo "${dir_size} MB: ${dir}"
        fi
    done
}

get_du_output | sort -nr

printf "\n"
echo "--------------------------"
printf "\n"
exit 0
