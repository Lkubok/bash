#!/usr/bin/env bash

# result=[[ "hello" == "hello" ]]
#
# echo "${result}"

read -rp "Enter name: " name

declare -r name

echo '-----'

# if [[ $? == 1 ]]; then
if rm tesffrffr.txt 2>/dev/null; then
    ls -la
else
    echo "ERROR"
fi

echo '-----'

if [[ "${name}" == "Max" ]]; then
    echo "Your name is maximilian"
elif [[ "${name}" == "Lucas" ]]; then
    echo "Your name is Lucas"
else
    echo "your name is nothing"
fi

if [[ -x 'file2.txt' ]]; then
    echo "File exists"
else
    echo "File not executable"
fi

# [[ -z "${filename}" ]]
# echo $?
# [[ -e "${filename}" ]]
# echo $?
# [[ -n "${filename}" ]]
# echo $?

# exit code
# exit 1
