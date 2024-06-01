#!/usr/bin/env bash

something="READONLY"
declare -r something
something="CHANGED !!"
declare -r test_read="Read content"

echo "test ${test_read}"

test_read="Overwire"

echo "After read and write ${test_read}"

echo "Something ${something}"

declare -i num_one=26
num_one="hello"
echo "number of students ${num_one}"
echo "number of students ${num_one}"

declare -x NEW_TESTING="XXX"


