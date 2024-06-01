#!/usr/bin/env bash

# Backup utility

declare -a folders_to_backup
folders_to_backup=("./customers_data" "./inventory_data")

text_bold="$(tput bold)"
text_blue="$(tput setaf 6)"
text_reset="$(tput sgr0)"

formatted_todays_date=$(date '+%Y-%m-%d')

orders_file_name="orders-${formatted_todays_date}.sql"
orders_archive_name="orders-${formatted_todays_date}.sql.tar.bz2"

printf "\n"
echo "${text_bold}${text_blue}Shop backup utility ${text_reset}"
echo "--------------------------"
printf "\n"

log_error() {
    echo "${formatted_todays_date} / ${1}" >&2
    echo "${formatted_todays_date} / ${1}" >>backup.log
}

create_log() {
    echo "${formatted_todays_date} / ${1}" >>backup.log
}

bash ./backup_db.sh >"./backups/${orders_file_name}"

if tar -cjf "./backups/${orders_archive_name}" "./backups/${orders_file_name}" 2>&1 | tee --append backup.log; then
    echo "${text_blue}${text_bold}${orders_file_name}${text_reset} was successfully archived"
    create_log "Created ${orders_archive_name} "
    rm "./backups/${orders_file_name}"
else
    err_msg="Error occured during creation of ${orders_archive_name}"
    echo "${err_msg}" >&2
    log_error "${err_msg}"
fi

# Could use basename for filename

for dir in "${folders_to_backup[@]}"; do
    backup_name="${dir##*./}-${formatted_todays_date}.tar.bz2"

    if tar -cjf "./backups/${backup_name}" "$dir" 2>&1 | tee --append backup.log; then
        echo "${text_blue}${text_bold}${backup_name}${text_reset} was successfully archived"
        create_log "Created ${backup_name} "
    else
        err_msg="Error occured during creation of ${backup_name}"
        echo "${err_msg}" >&2
        log_error "${err_msg}"
    fi
done
