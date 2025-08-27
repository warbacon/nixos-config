#!/usr/bin/env bash

if [[ -z "$1" ]]; then
    echo "You must specify a host."
    exit 1
fi

HOSTNAME="$1"
USERNAME="warbacon"

sudo nixos-rebuild switch --extra-experimental-features="nix-command flakes" .#"${HOSTNAME}"

if [[ ! -d "/home/${USERNAME}/.config/nvim" ]]; then
    git clone https://github.com/warbacon/nvim-config "/home/${USERNAME}/.config/nvim"
fi
