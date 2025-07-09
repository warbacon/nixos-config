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

    notify-send "Brillo" "$(get_brightness) %" -h int:value:"$(get_brightness)" -h int:transient:1 -h string:x-dunst-stack-tag:brightness -h string:synchronous:brightness -t $TIMEOUT
}

main "$@"
