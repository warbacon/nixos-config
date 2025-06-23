#!/usr/bin/env bash

set -e

if [[ -z "$1" ]]; then
    echo "You must specify a host."
    exit 1
fi

HOSTNAME="$1"
USERNAME="warbacon"

sudo nixos-rebuild switch --flake .#"${HOSTNAME}"

if [[ ! -d "/home/${USERNAME}/.config/nvim" ]]; then
    git clone https://github.com/warbacon/nvim-config "/home/${USERNAME}/.config/nvim"
fi
