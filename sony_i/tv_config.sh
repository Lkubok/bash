#!/usr/bin/env bash

api_key=$(dialog --keep-tite --inputbox 'Enter TV IP address' 0 0 2>&1 >/dev/tty)

if [[ -n $SONY_BRAVIA_IP ]]; then
    if [[ $SHELL == "/bin/bash" ]]; then
        sed -i -e "s/SONY_BRAVIA_IP.*/SONY_BRAVIA_IP=${api_key}/g" ~/.bashrc
    elif [[ $SHELL == "/bin/zsh" ]]; then
        sed -i -e "s/SONY_BRAVIA_IP.*/SONY_BRAVIA_IP=${api_key}/g" ~/.zshrc
    fi
else
    if [[ $SHELL == "/bin/bash" ]]; then
        echo "export SONY_BRAVIA_IP=${api_key}" >>~/.bashrc
    elif [[ $SHELL == "/bin/zsh" ]]; then
        echo "export SONY_BRAVIA_IP=${api_key}" >>~/.zshrc
    fi
fi

api_key=$(dialog --keep-tite --inputbox 'Enter TV pre-generated key' 0 0 2>&1 >/dev/tty)

if [[ -n $X_AUTH_PSK ]]; then
    if [[ $SHELL == "/bin/bash" ]]; then
        sed -i -e "s/X_AUTH_PSK.*/X_AUTH_PSK=${api_key}/g" ~/.bashrc
    elif [[ $SHELL == "/bin/zsh" ]]; then
        sed -i -e "s/X_AUTH_PSK.*/X_AUTH_PSK=${api_key}/g" ~/.zshrc
    fi
else
    if [[ $SHELL == "/bin/bash" ]]; then
        echo "export X_AUTH_PSK=${api_key}" >>~/.bashrc
    elif [[ $SHELL == "/bin/zsh" ]]; then
        echo "export X_AUTH_PSK=${api_key}" >>~/.zshrc
    fi
fi
