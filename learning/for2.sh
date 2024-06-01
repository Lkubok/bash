#!/usr/bin/env bash

for file in sub-{a,b,c}{.csv,.txt,.doc,.jpg,.png}; do
    touch "${file}"
done
