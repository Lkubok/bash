#!/usr/bin/env bash

shopping1="Apple"
shopping2="Banana"
shopping3="Passion Fruit"

echo "${shopping1}" "${shopping2}" "${shopping3}"

declare -a fruits=("One" "Two" "Third element")
fruits_array=("${shopping1}" "${shopping2}" "${shopping3}")
echo "${fruits}"

# Array access
echo "${fruits_array[1]}"
echo "${fruits_array[-1]}"
echo "ALL array:" "${fruits_array[@]}"
echo "ALL array:" "${fruits_array[*]}"
# Rewriting element
fruits_array[2]="mango"
echo "ALL array:" "${fruits_array[@]}"
fruits_array[4]="grapes"
echo "ALL array:" "${fruits_array[@]}"
arr_length="${#fruits_array[@]}"
echo "ARR lenght is ${arr_length}"
echo "ADD to array"
# Adding new element
fruits_array+=("nowy owoc")
echo "Nowa arrajka" "${fruits_array[@]}"
echo "new length" "${#fruits_array[@]}"
# Removing element
unset "fruits_array[2]"
echo "After delete arrajka" "${fruits_array[@]}"
echo "new length" "${#fruits_array[@]}"
# Slice
echo "${fruits_array[@]:1:2}"
echo "After slice arrajka" "${fruits_array[@]}"
# Copying
copy_fruits=("${fruits_array[@]}")
echo "Copied" "${copy_fruits[@]}"
# Expanding
expanded=("roslinka" "${copy_fruits[@]}" "rozdymka")
echp "Expanded" "${expanded[@]}"
# Looping through an array
for fruit in "${expanded[@]}"; do
    echo "Single fruit in Loopd is: " "${fruit}"
done
