ID=1000
TIMEOUT=2000

get_brightness() {
    echo $(($(brightnessctl get) * 100 / $(brightnessctl max)))
}

main() {
    case "$1" in
        up)
            brightnessctl -e4 -n1 set 5%+
            ;;
        down)
            brightnessctl -e4 -n1 set 5%-
            ;;
        *)
            notify-send "change_brightness.sh" "Argument \"$1\" is not valid." -u critical
            exit 1
            ;;
    esac

    notify-send "Brillo" -h int:value:"$(get_brightness)" -r $ID -t $TIMEOUT
}

main "$@"
