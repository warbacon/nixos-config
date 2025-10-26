#!/usr/bin/env bash

declare -a MENU=(
    "󰖔 Luz nocturna|pkill sunsetr || sunsetr"
    "󰒲 Suspender|systemctl suspend"
    "󰐥 Apagar|systemctl poweroff"
    "󰜉 Reiniciar|systemctl reboot"
    "󰿅 Cerrar sesión|loginctl terminate-user \"\""
)

STYLES="window { width: 500px; } listview { scrollbar: false; }"

options=()
declare -A commands
for item in "${MENU[@]}"; do
    label="${item%%|*}"
    cmd="${item#*|}"
    options+=("$label")
    commands["$label"]="$cmd"
done

selected="$(printf "%s\n" "${options[@]}" | rofi -dmenu -i -p Comandos -l "${#options[@]}" -theme-str "$STYLES")"

if [[ -n "${commands[$selected]}" ]]; then
    eval "${commands[$selected]}"
else
    echo "Something went wrong."
    exit 1
fi
