#!/usr/bin/env bash

set -e

if [[ -z "$1" ]]; then
    echo "You must specify a host."
    exit 1
fi

sudo nixos-rebuild switch --flake .#"${1}"

if [[ ! -d "$HOME/.config/nvim" ]]; then
    git clone https://github.com/warbacon/nvim-config "$HOME/.config/nvim"
fi
