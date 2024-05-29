#!/usr/bin/env bash

curl --location "192.168.233.5/sony/audio" \
--header "X-Auth-PSK: ${X_AUTH_PSK}" \
--header "Content-Type: application/json" \
--data '{
    "method": "setAudioVolume",
    "id": 98,
    "params": [{
        "volume": "'$1'",
        "ui": "on",
        "target": "speaker"
    }],
    "version": "1.2"
}'
