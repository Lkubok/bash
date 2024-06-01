#!/usr/bin/env bash

script_directory=$( dirname -- "${BASH_SOURCE[0]}")

echo "${script_directory}"

ls "${script_directory}"

touch "${script_directory}/paths.txt"

# dirname -- "${BASH_SOURCE[0]}"
