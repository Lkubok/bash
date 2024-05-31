#!/usr/bin/env bash

selected=$(dialog --keep-tite --no-tags --menu 'Select Distro' 0 0 0 'ubu' 'Ubuntu1' 'cen' 'CentOS1' 2>&1 >/dev/tty)

echo "${selected}"
