#!/usr/bin/env bash

cleanup() {
    echo "Cleaning up"
    exit 1
}
trap cleanup SIGINT SIGTERM
while true; do
    sleep 1
done
