#!/usr/bin/env bash

script_directory=$(dirname -- "${BASH_SOURCE[0]}")

version="0.1.0"

text_bold=$(tput bold)
text_success=$(tput setaf 2)
text_info=$(tput setaf 6)
text_reset=$(tput sgr0)

backtitle="Custom Bash scripts installer ${version}"
menu_select_commands_title="Select commands to install"
dialog_select_params=

installable_folders=$(ls -d */ | grep "_i")

for folder in ${installable_folders}; do
    pos_name=$(cat "${script_directory}/${folder}info.txt")
    echo "${pos_name}"
    single_arg=$(echo "${folder}" "${pos_name}" "1 ")
    dialog_select_params+="${single_arg}"
done

echo "${dialog_select_params}"
dialog_answer=$(dialog --keep-tite --no-tags --backtitle "${backtitle}" --checklist "${menu_select_commands_title}" 0 0 0 ${dialog_select_params} 2>&1 >/dev/tty)
echo "${dialog_answer}"
