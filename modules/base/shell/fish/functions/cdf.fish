function cdf
    set dir (fd --type directory -H \
        --exclude .git \
        --exclude node_modules \
        --exclude .cache \
        --exclude .local/share/Trash \
        --exclude .vscode \
        | fzf --border --layout=reverse)

    if test -n "$dir"
        cd "$dir"
        commandline -f repaint
    end
end
