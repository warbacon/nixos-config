declare -a OPTIONS=(
    "Luz nocturna"
    "Recargar waybar"
    "Suspender"
    "Apagar"
    "Reiniciar"
    "Cerrar sesión"
)

STYLES="window { width: 500px; } listview { scrollbar: false; }"
selected="$(printf "%s\n" "${OPTIONS[@]}" | rofi -dmenu -i -p Comandos -l 5 -theme-str "$STYLES")"

case "$selected" in
    "Luz nocturna")
        pkill hyprsunset || hyprsunset -t 3500
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
