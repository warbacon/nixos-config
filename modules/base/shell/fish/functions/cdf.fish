function cdf
    set dir (fd --type directory -H \
        --exclude .git \
        --exclude node_modules \
        --exclude .cache \
        --exclude .local/share/Trash \
        --exclude .vscode \
        --exclude .npm \
        --exclude .docker \
        --exclude .mozilla \
        --exclude vendor \
        | fzf --border --layout=reverse --preview="eza --tree --color=always --level 3 --icons=always {}")

    if test -n "$dir"
        cd "$dir"
        commandline -f repaint
    end
end
