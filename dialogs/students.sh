#!/usr/bin/env bash

should_continue=true

while ((should_continue == 0)); do
    student_name=$(dialog --keep-tite --backtitle "Students Script v 0.1" --inputbox "Please enter student name: " 0 0 2>&1 >/dev/tty)
    echo "${student_name}" >>students.txt
    dialog --keep-tite --backtitle "Students Script v 0.1" --yesno "Do you want to continue ?" 0 0
    if (($? == 1)); then
        break
    fi
done
