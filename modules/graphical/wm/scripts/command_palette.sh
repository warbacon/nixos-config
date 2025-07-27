declare -a OPTIONS=(
    "Luz nocturna"
    "Recogecolor"
    "Recargar waybar"
    "Suspender"
    "Apagar"
    "Reiniciar"
    "Cerrar sesión"
)

STYLES="window { width: 500px; } listview { scrollbar: false; }"
selected="$(printf "%s\n" "${OPTIONS[@]}" | rofi -dmenu -i -p Comandos -l "${#OPTIONS[@]}" -theme-str "$STYLES")"

case "$selected" in
    "Luz nocturna")
        if command -v hyprsunset &>/dev/null; then
            pkill hyprsunset || hyprsunset -t 3500
        elif command -v gammastep &>/dev/null; then
            pkill gammastep || gammastep -O 3500
        fi
        ;;
    "Recogecolor")
        sleep 0.2 && hyprpicker -a
        ;;
    "Recargar waybar")
        systemctl --user restart waybar
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
        loginctl terminate-user ""
        ;;
    *)
        echo "Se ha liado."
        exit 1
        ;;
esac
