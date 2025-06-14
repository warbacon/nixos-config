WATCHED_FILE="$HOME/.config/background"

echo "$WATCHED_FILE" | entr -np systemctl --user restart hyprpaper.service
