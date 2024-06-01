#!/usr/bin/env bash

read -rp "Please enter your fruits: " -a fruits
read -a uptime_data < <(uptime)

echo "Your name is" "${fruits[@]}"

echo "Uptime" "${uptime_data[2]}"
