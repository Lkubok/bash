#!/usr/bin/env bash
ver="0.1.0"

working_dir=$(dirname -- "${BASH_SOURCE[0]}")
install_dir="${HOME}/bin"

version="0.1.0"

text_bold=$(tput bold)
text_success=$(tput setaf 2)
text_error=$(tput setaf 1)
text_info=$(tput setaf 6)
text_reset=$(tput sgr0)

backtitle="Custom Bash scripts installer ${version}"
menu_select_commands_title="Select commands to install"
dialog_select_params=
declare -a files_to_update

installable_folders=$(ls -d */ | grep "_i")

printf "\n"
echo "${text_bold}${text_info}Custom scripts installer ${ver}: ${text_reset}"
echo "--------------------------"
printf "\n"

# Building params for dialog
for folder in ${installable_folders}; do
    pos_name=$(cat "${working_dir}/${folder}info.txt")
    single_arg=$(echo "${folder}" "${pos_name}" "1 ")
    dialog_select_params+="${single_arg}"
done

# Checking for user's bin directory
if [[ ! -d $install_dir ]]; then
    mkdir $install_dir
else
    echo "Directory ${text_info}${install_dir}${text_reset} exists, skipping"
fi

# Scripts selection
dialog_answer=$(dialog --keep-tite --no-tags --backtitle "${backtitle}" --checklist "${menu_select_commands_title}" 0 0 0 ${dialog_select_params} 2>&1 >/dev/tty)

# Installing scripts
for scripts_folder in ${dialog_answer}; do
    cp ${working_dir}/${scripts_folder}*.sh "${install_dir}"
    echo "${text_bold}${text_success}$(cat ${working_dir}/${scripts_folder}info.txt)${text_reset} installed"
    files_to_update+=($(echo ${working_dir}/${scripts_folder}*.sh))
done

# Remove old script versions
for script_to_remove in "${files_to_update[@]}"; do
    to_remove=$(basename "${script_to_remove//.sh/''}")
    rm "${install_dir}/${to_remove}"
done

# Cleanup after install
readarray -t files < <(ls $install_dir)
for file in "${files[@]}"; do
    mv "${install_dir}/$file" "${install_dir}/${file//.sh/''}"
done

# $PATH check
if [[ ! $PATH == *${install_dir}* ]]; then
    echo "Current path does not contain ${text_error}${text_bold}${install_dir}${text_reset}"
    if [[ $SHELL == "/bin/bash" ]]; then
        echo "Adding ${text_info}${install_dir}${text_reset} to \$PATH"
        echo "export PATH=\""${install_dir}:'$PATH'\""" >>~/.bashrc
    elif [[ $SHELL == "/bin/zsh" ]]; then
        echo "Adding ${text_info}${install_dir}${text_reset} to \$PATH"
        echo "export PATH=\""${install_dir}:'$PATH'\""" >>~/.zshrc
    fi
fi

printf "\n"
printf "\n"
