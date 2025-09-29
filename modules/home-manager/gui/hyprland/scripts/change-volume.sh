readonly TIMEOUT=2000
readonly AUDIO_SINK="@DEFAULT_AUDIO_SINK@"
readonly AUDIO_SOURCE="@DEFAULT_AUDIO_SOURCE@"

get_volume() {
    wpctl get-volume "$AUDIO_SINK" | awk '{print int($2 * 100)}'
}

is_muted() {
    local device="$1"
    wpctl get-volume "$device" | grep -q "MUTED"
}

play_volume_sound() {
    play-sound audio-volume-change 2>/dev/null &
}

send_notification() {
    local title="$1"
    local message="$2"
    local urgency="${3:-normal}"

    if [[ "$urgency" == "critical" ]]; then
        fyi -u critical -t "$TIMEOUT" "$title" "$message"
    else
        fyi -c osd -H string:x-dunst-stack-tag:osd -H string:synchronous:osd -H int:transient:1 -t "$TIMEOUT" ${4:+-H int:value:"$4"} "$title" "$message"
    fi
}

volume_up() {
    wpctl set-mute "$AUDIO_SINK" 0
    wpctl set-volume "$AUDIO_SINK" 5%+ --limit 1.0

    local volume
    volume=$(get_volume)
    send_notification "Audio" "$volume %" "normal" "$volume"
    play_volume_sound
}

volume_down() {
    wpctl set-mute "$AUDIO_SINK" 0
    wpctl set-volume "$AUDIO_SINK" 5%-

    local volume
    volume=$(get_volume)
    send_notification "Audio" "$volume %" "normal" "$volume"
    play_volume_sound
}

toggle_audio_mute() {
    wpctl set-mute "$AUDIO_SINK" toggle

    local status
    if is_muted "$AUDIO_SINK"; then
        status="Desactivado"
    else
        status="Activado"
    fi

    send_notification "Audio" "$status"
}

toggle_mic_mute() {
    wpctl set-mute "$AUDIO_SOURCE" toggle

    local status
    if is_muted "$AUDIO_SOURCE"; then
        status="Desactivado"
    else
        status="Activado"
    fi

    send_notification "Micrófono" "$status"
}

show_usage() {
    echo "Usage: $0 {up|down|muteaudio|mutemic}"
    echo "  up        - Increase volume by 5%"
    echo "  down      - Decrease volume by 5%"
    echo "  muteaudio - Toggle audio mute"
    echo "  mutemic   - Toggle microphone mute"
}

main() {
    case "$1" in
        up)
            volume_up
            ;;
        down)
            volume_down
            ;;
        muteaudio)
            toggle_audio_mute
            ;;
        mutemic)
            toggle_mic_mute
            ;;
        -h | --help)
            show_usage
            exit 0
            ;;
        "")
            echo "Error: No argument provided"
            show_usage
            exit 1
            ;;
        *)
            echo "Error: Invalid argument '$1'"
            show_usage
            send_notification "change_volume.sh" "Argument \"$1\" is not valid." "critical"
            exit 1
            ;;
    esac
}

main "$@"
