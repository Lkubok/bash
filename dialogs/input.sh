#!/usr/bin/env bash

message=$(dialog --keep-tite --inputbox 'Message' 0 0 2>&1 >/dev/tty)

echo "${message}"
