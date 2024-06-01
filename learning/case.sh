#!/usr/bin/env bash

read -rp 'Please enter your OS: ' os

case "${os}" in
[lL]inux | [dD]ebian)
    echo "Your system is Linux"
    ;;
[mM]ac)
    echo "Your system is MacOS"
    ;;
RHEL) ;&
CentOS)
    echo "use dnf, your system is CENT_OS"
    ;;
*)
    echo "Your system recognition is over"
    ;;
esac

exit 0
