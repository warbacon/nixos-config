#!/usr/bin/env bash

if [[ $# -lt 1 ]]; then
    echo "Usage: $(basename "$0") <fullscreen|select|window>" >&2
    exit 1
fi

readonly MODE="$1"
readonly FILENAME="$(date +'%Y-%m-%d-%H%M%S.png')"
readonly OUTPUT="$HOME/Imágenes/Capturas de pantalla/$FILENAME"
readonly ORIGINAL_ROUNDING="$(hyprctl -j getoption decoration:rounding | jq -r '.int')"

freeze_screen() {
    hyprpicker -rz &
    sleep 0.2
}

grab_window() {
    local monitors clients boxes active_workspaces

    monitors=$(hyprctl -j monitors)
    active_workspaces=$(echo "$monitors" | jq -r 'map(.activeWorkspace.id) | join(",")')

    clients=$(hyprctl -j clients | jq --argjson ids "[$active_workspaces]" \
        '[.[] | select(.workspace.id as $wid | $ids | index($wid) != null)]')

    boxes=$(echo "$clients" | jq -r '.[] | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')

    slurp -r <<<"$boxes"
}

cleanup() {
    pkill hyprpicker 2>/dev/null
    hyprctl keyword decoration:rounding "$ORIGINAL_ROUNDING"
}

capture_fullscreen() {
    grim - | satty -f - --copy-command wl-copy --fullscreen -o "$OUTPUT"
}

capture_select() {
    freeze_screen

    local geometry
    geometry=$(slurp)
    pkill hyprpicker

    grim -g "$geometry" - | satty -f - --copy-command wl-copy -o "$OUTPUT"
}

capture_window() {
    hyprctl keyword decoration:rounding 0
    freeze_screen

    local temp_file
    temp_file=$(mktemp --suffix=.png)

    grim -g "$(grab_window)" "$temp_file"
    pkill hyprpicker
    hyprctl keyword decoration:rounding "$ORIGINAL_ROUNDING"

    satty -f "$temp_file" --copy-command wl-copy -o "$OUTPUT"
    rm "$temp_file"
}

main() {
    trap cleanup EXIT

    case "$MODE" in
        fullscreen) capture_fullscreen ;;
        select) capture_select ;;
        window) capture_window ;;
        *)
            fyi -u critical "Screenshot" "Modo desconocido: $MODE"
            exit 1
            ;;
    esac
}

main "$@"
