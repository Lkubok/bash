#!/usr/bin/env bash

# Associtive arrays

declare -A student_scores

student_scores["john"]=95
student_scores["patrick"]=100
student_scores["kirby"]=40

# Other way

declare -A student_scores2=(
    ["john"]=95
    ["patrick"]=100
    ["kirby"]=40
)

echo "ALL keys"

echo "${!student_scores[@]}"

echo "${student_scores[@]}"
echo "${student_scores[john]}"

for name in "${!student_scores[@]}"; do

    echo "- ${name}: ${student_scores[${name}]}"

done

# Echeck exstince of key

if [[ -v student_scores["john"] ]]; then
    echo "YES"
else
    echo "no"
fi
