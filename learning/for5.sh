#!/usr/bin/env bash

start=23
end=41

for i in $(seq $start $end); do
    echo $i
done

for word in $(cat lorem.txt); do

    echo $word

done
