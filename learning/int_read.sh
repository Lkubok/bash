#!/usr/bin/env bash

echo -n "Please enter an integer: "
read value
declare -i value
value="${value//[^0-9]/}"

# echo "${value//[^0-9]/}"
echo "${value}"
