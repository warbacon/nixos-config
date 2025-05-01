declare -a OPTIONS=(
    "Luz nocturna"
    "Recogecolor"
    "Recargar waybar"
)

declare -a POWER_OPTIONS=(
    "Suspender"
    "Apagar"
    "Reiniciar"
    "Cerrar sesión"
)

if [[ "$1" = "powermenu" ]]; then
    ALL_OPTIONS=("${POWER_OPTIONS[@]}")
    PROMPT="Menú de apagado"
else
    ALL_OPTIONS=("${OPTIONS[@]}")
    PROMPT="Comandos"
fi

STYLES="window { width: 500px; } listview { scrollbar: false; }"
selected="$(printf "%s\n" "${ALL_OPTIONS[@]}" | rofi -dmenu -i -p "$PROMPT" -l "${#ALL_OPTIONS[@]}" -theme-str "$STYLES")"

case "$selected" in
    "Luz nocturna")
        pkill hyprsunset || hyprsunset -t 3500
        ;;
    "Recogecolor")
        sleep 0.1 && hyprpicker -a
        ;;
    "Recargar waybar")
        pkill -u "$USER" -USR2 waybar || true
        ;;
    "Suspender")
        systemctl suspend
        ;;
    "Apagar")
        systemctl poweroff
        ;;
    "Reiniciar")
        systemctl reboot
        ;;
    "Cerrar sesión")
        uwsm stop || hyprctl dispatch exit || pkill -KILL -u "$USER"
        ;;
    *)
        echo "Se ha liado."
        exit 1
        ;;
esac
