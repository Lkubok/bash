#!/usr/bin/env bash

echo " var 1 - $1"
echo " var 2 - $2"

getopts 'al' option

echo "option variable: ${option}"

getopts 'al' option
echo "option variable: ${option}"
