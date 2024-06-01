#!/usr/bin/env bash

awk '{sum += $1} END { print sum }' numbers.txt

awk -F "; " '{ sum += $2 } END { print sum }' population.txt
