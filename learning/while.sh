#!/usr/bin/env bash

counter=0

# while [[ counter -lt 10 ]]; do
#     sleep 0.1s
#     ((counter = counter + 1))
#     echo "Hello world ${counter}"
# done

while [[ counter -lt 10 ]]; do
    sleep 0.1s
    ((counter = counter + 1))
    if ((counter == 5)); then
        continue
    fi

    if ((counter == 7)); then
        break
    fi

    echo "Hello world ${counter}"
done
