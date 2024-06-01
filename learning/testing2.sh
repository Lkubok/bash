#!/usr/bin/env bash

read -rp "Please enter your age: " age
declare -i age

if [[ "${age}" -lt 30 ]]; then
    echo "Your age is lesser than 30"
else
    echo "Your age is more than 30"
fi

if ((age < 30)); then
    echo "Your age is lesser than 30"
else
    echo "Your age is more than 30"
fi
