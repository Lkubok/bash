#!/usr/bin/env bash
ver="0.1.0"

working_dir=$(dirname -- "${BASH_SOURCE[0]}")
install_dir="${HOME}/bin"

version="0.1.0"

text_bold=$(tput bold)
text_success=$(tput setaf 2)
text_info=$(tput setaf 6)
text_reset=$(tput sgr0)

backtitle="Custom Bash scripts installer ${version}"
menu_select_commands_title="Select commands to install"
dialog_select_params=

installable_folders=$(ls -d */ | grep "_i")
# declare -a new_scripts

printf "\n"
echo "${text_bold}${text_info}Custom scripts installer ${ver}: ${text_reset}"
echo "--------------------------"
printf "\n"

for folder in ${installable_folders}; do
    pos_name=$(cat "${working_dir}/${folder}info.txt")
    single_arg=$(echo "${folder}" "${pos_name}" "1 ")
    dialog_select_params+="${single_arg}"
done

if [[ ! -d $install_dir ]]; then
    mkdir $install_dir
else
    echo "Directory ${text_info}${install_dir}${text_reset} exists, skipping"
fi

dialog_answer=$(dialog --keep-tite --no-tags --backtitle "${backtitle}" --checklist "${menu_select_commands_title}" 0 0 0 ${dialog_select_params} 2>&1 >/dev/tty)

for scripts_folder in ${dialog_answer}; do
    cp ${working_dir}/${scripts_folder}*.sh "${install_dir}"
    echo "${text_bold}${text_success}$(cat ${working_dir}/${scripts_folder}info.txt)${text_reset} installed"
done

readarray -t files < <(ls $install_dir)

# Cleanup after install
for file in "${files[@]}"; do
    mv "${install_dir}/$file" "${install_dir}/${file//.sh/''}"
done

# $PATH check

if [[ ! $PATH == *${install_dir}* ]]; then
    if [[ $SHELL == "/bin/bash" ]]; then
        echo "export PATH=\""${install_dir}:'$PATH'\""" >>~/.bashrc
        source "${HOME}/.bashrc"
    elif [[ $SHELL == "/bin.zsh" ]]; then
        echo "export PATH=\""${install_dir}:'$PATH'\""" >>~/.zshrc
        source "${HOME}/.zshrc"
    fi
fi
