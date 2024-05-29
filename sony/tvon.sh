#!/usr/bin/env bash

curl --location '192.168.233.5/sony/system' \
--header "X-Auth-PSK: ${X_AUTH_PSK}" \
--header 'Content-Type: application/json' \
--data '{
    "method": "setPowerStatus",
    "id": 55,
    "params": [{"status": true}],
    "version": "1.0"
}'
