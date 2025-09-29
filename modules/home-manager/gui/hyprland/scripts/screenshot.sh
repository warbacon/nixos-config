#!/usr/bin/env bash

if [[ $# -lt 1 ]]; then
    echo "Uso: $(basename "$0") <fullscreen|select>" >&2
    exit 1
fi

MODE="$1"
FILENAME="$(date +'%Y-%m-%d-%H%M%S.png')"
OUTPUT="$HOME/Imágenes/Capturas de pantalla/$FILENAME"

case "$MODE" in
    fullscreen)
        grim - | satty -f - --copy-command wl-copy --fullscreen -o "$OUTPUT"
        ;;
    select)
        grim -g "$(slurp)" - | satty -f - --copy-command wl-copy -o "$OUTPUT"
        ;;
    *)
        fyi -u critical "Screenshot" "Modo desconocido: $MODE"
        exit 1
        ;;
esac
