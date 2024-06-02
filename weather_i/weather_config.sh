#!/usr/bin/env bash

api_key=$(dialog --keep-tite --inputbox 'Enter Weather API key' 0 0 2>&1 >/dev/tty)

if [[ -n $WEATHER_API_KEY ]]; then
    if [[ $SHELL == "/bin/bash" ]]; then
        sed -i -e "s/WEATHER_API.*/WEATHER_API_KEY=${api_key}/g" ~/.bashrc
    elif [[ $SHELL == "/bin/zsh" ]]; then
        sed -i -e "s/WEATHER_API.*/WEATHER_API_KEY=${api_key}/g" ~/.zshrc
    fi
else
    if [[ $SHELL == "/bin/bash" ]]; then
        echo "export WEATHER_API_KEY=${api_key}" >>~/.bashrc
    elif [[ $SHELL == "/bin/zsh" ]]; then
        echo "export WEATHER_API_KEY=${api_key}" >>~/.zshrc
    fi
fi
