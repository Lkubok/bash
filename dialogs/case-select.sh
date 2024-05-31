#!/usr/bin/env bash

select option in "uptime" "user" "free disk spacde" "quit"; do
    case "${option}" in
    uptime)
        uptime
        break
        ;;
    user)
        whoami
        break
        ;;
    free*)
        df -hT
        break
        ;;
    quit)
        exit 0
        ;;
    *)
        echo "wrong answer, quiting" >&2
        break
        ;;
    esac
    echo "${REPLY}: ${option}"
done
