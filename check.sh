#!/usr/bin/env bash

install_dir="${HOME}/bin"

echo "Checking"

if [[ ! $PATH == *${install_dir}* ]]; then
    echo "not in path"
    if [[ $SHELL == "/bin/bash" ]]; then
        echo "BASH"
        echo "export PATH=\""${install_dir}:'$PATH'\""" >>~/.bashrc
        source "${HOME}/.bashrc"
    elif [[ $SHELL == "/bin.zsh" ]]; then
        echo 'ZSH'
        echo "export PATH=\""${install_dir}:'$PATH'\""" >>~/.zshrc
        source "${HOME}/.zshrc"
    fi
else
	echo "IN PATH"
	echo $PATH
fi
