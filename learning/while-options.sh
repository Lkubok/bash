#!/usr/bin/env bash

# while true; do
#     getopts 'lra' options 2>/dev/null
#     if (($? != 0)); then
#         break
#     fi
#     echo "detected option is: ${options}"
# done

what_to_do=
quiet=1

while getopts 'alrhqf:' opt; do

    case "${opt}" in
    h)
        echo "Selected option is -h"
        what_to_do="show_help"
        break
        ;;
    q)
        quiet=0
        ;;
    a)
        echo "Selected option is -a"
        ;;
    l)
        echo "Selected option is -l"
        ;;
    r)
        echo "Selected option is -r"
        ;;
    f)
        cat "${OPTARG}"
        ;;
    *)
        echo "Error occured, unknown option -${opt}"
        ;;
    esac

done

# while getopts 'alr' opt 2>/dev/null; do
#     echo "${opt}"
# done

if [[ "${what_to_do}" == "show_help" ]]; then
    echo "Help version 0.0.1"
    echo "No help available at the moment"
    exit 0
fi

if [[ "${quiet}" == 1 ]]; then
    date
fi
