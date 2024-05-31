#!/usr/bin/env bash

if dialog --keep-tite --yesno 'Are you sure? ' 0 0; then
    echo "Selected yes"
else
    echo "Selected no"
fi
