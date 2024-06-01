#!/usr/bin/env bash

declare -r text_green="$(tput setaf 2)$(tput bold)"
declare -r text_reset="$(tput sgr0)"

read -rp "Provide your name: " user_name

echo "---------------------------"
echo "Welcome ${user_name} to our system"
number_of_files_on_desktop="$(ls ~/Desktop | wc -l)"
echo "You have ${text_green} ${number_of_files_on_desktop} ${text_reset} files on your desktop"
echo "---------------------------"
