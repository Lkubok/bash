#!/usr/bin/env bash

for name in "Lauren M." "Liver T."; do
    echo "${name}"
done

for number in 1 2 3 4 5 6 7; do
    echo $number
done

echo "OTHER LOOP"

for number in {1..40..2}; do
    if ((number == 6)); then
        break
    fi
    echo "${number}"
done
