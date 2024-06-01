#!/usr/bin/env bash



y=20
x=10

((result = x + y))

echo "${result} new result $((x + y + 14))"


declare -i var
var=15
echo "${var}"


z=14
var=$(( 15 * z ))
((var = 15 * z))
echo "${var}"
