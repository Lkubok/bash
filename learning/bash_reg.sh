#!/usr/bin/env bash

read -rp "Enter email: " email

if [[ $email =~ ^.*@.*\..*$ ]]; then
    echo "Valid email address"
else
    echo "Invalid email address"
fi
