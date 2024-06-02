#!/usr/bin/env bash

read -t 10 -s -p "Enter root password: " pass

text_bold="$(tput bold)"
text_success="$(tput setaf 2)"
# text_error="$(tput setaf 1)"
text_blue="$(tput setaf 6)"
text_reset="$(tput sgr0)"

# system_load="$(cut -d " " -f 11-20 < <(uptime))"
system_load=$(uptime)
most_extensive_process="$(sed 1d < <(ps -ef --sort=-pcpu | head -2))"
main_drive_usage="$(df -h | grep -w "/" | head -1)"
memory_avilable="$(cat /proc/meminfo | grep MemAvailable)"
# ipaddr="$(ip addr show | grep -w inet | tr -s "\n" " " && echo)"
ipaddr=$(ip addr show | grep -o -E '(([0-9]{1,3})\.?){4}/[0-9]{2}' | tr "\n" " ")
macaddr="$(ip addr show | grep -w "link" | tr -s "\n" " " && echo)"
firewall_services="$(echo ${pass} | sudo -S firewall-cmd --list-all | grep services | cut -d ":" -f 2 | tr -d "\n" && echo)"
firewall_ports="$(echo ${pass} | sudo -S firewall-cmd --list-all | grep ports | cut -d ":" -f 2 | tr -d "\n" && echo)"

printf "\n"
echo "${text_bold}${text_success}System status information: ${text_reset}"
echo "--------------------------"

echo "${text_blue}System Load:${text_reset}                  ${text_bold}${system_load}${text_reset}"
echo "${text_blue}Main drive usage:${text_reset}             ${text_bold}${main_drive_usage}${text_reset}"
echo "${text_blue}Memory Available:${text_reset}             ${text_bold}${memory_avilable}${text_reset}"
echo "${text_blue}SSH Status:${text_reset}              ${text_bold}$(systemctl status ssh | grep -F "Active: ")${text_reset}"
echo "${text_blue}HTTPD Status:${text_reset}            ${text_bold}$(systemctl status apache2 | grep -F "Active: ")${text_reset}"
echo "${text_blue}Firewall status:${text_reset}         ${text_bold}$(systemctl status firewalld | grep -F "Active: ")${text_reset}"
echo "${text_blue}SAMBA Status:${text_reset}            ${text_bold}$(systemctl status smb | grep -F "Active: ")${text_reset}"
echo "${text_blue}IP address:${text_reset}                   ${text_bold}${ipaddr}${text_reset}"
echo "${text_blue}MAC address:${text_reset}                 ${text_bold}${macaddr}${text_reset}"
echo "${text_blue}Firewall ports open:${text_reset}          ${text_bold}${firewall_ports}${text_reset}"
echo "${text_blue}Firewall services open:${text_reset}      ${text_bold}${firewall_services}${text_reset}"
echo "${text_blue}System:${text_reset}                       ${text_bold}$(lsb_release -a | tr -s "\n" " ")${text_reset}"
echo "${text_blue}Most extensive process:${text_reset}       ${text_bold}${most_extensive_process}${text_reset}"
