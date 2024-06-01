#!/usr/bin/env bash

for file in *.{jpg,png}; do
    if [[ -f "${file}" ]]; then
        echo "${file}"
    fi
done
