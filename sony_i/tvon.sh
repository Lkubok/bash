#!/usr/bin/env bash

curl --location "${SONY_BRAVIA_IP}/sony/system" \
    --header "X-Auth-PSK: ${X_AUTH_PSK}" \
    --header 'Content-Type: application/json' \
    --data '{
    "method": "setPowerStatus",
    "id": 55,
    "params": [{"status": true}],
    "version": "1.0"
}'
