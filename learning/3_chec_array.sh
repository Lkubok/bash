#!/usr/bin/env bash

# default_search_for="banana"
declare search_for
read -rp "Prvide phrase to search: " search_for

declare -a fruits
fruits=("apple" "banana" "passion fruit")

# search_text="${1:-$default_search_for}"
found=0

echo "Search for value: ${search_for}"

for item in "${fruits[@]}"; do
    echo "SEARCHING: ${item} ${search_for}"
    if [[ $item == "${search_for}" ]]; then
        found=1
        break
    fi
done

if [[ $found == "1" ]]; then
    echo "Found element"
    exit 0
else
    echo "Element not found"
    exit 1
fi
