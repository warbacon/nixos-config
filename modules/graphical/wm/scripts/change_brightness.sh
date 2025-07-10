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
            fyi -u critical "change_brightness.sh" "Argument \"$1\" is not valid."
            exit 1
            ;;
    esac

    fyi -H int:value:"$(get_brightness)" -H int:transient:1 -H string:x-dunst-stack-tag:brightness -H string:synchronous:brightness -t $TIMEOUT "Brillo" "$(get_brightness) %"
}

main "$@"
