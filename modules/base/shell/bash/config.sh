# INPUTRC ----------------------------------------------------------------------
bind -s "set completion-ignore-case on"
bind -s "set colored-stats on"
# ------------------------------------------------------------------------------

# ALIASES ----------------------------------------------------------------------
if command_exists eza && [[ "$TERM" != "linux" ]]; then
    alias ls="eza --icons=auto --group-directories-first"
    alias ll="eza --icons=auto --group-directories-first --git -l"
    alias la="eza --icons=auto --group-directories-first -a"
    alias lla="eza --icons=auto --group-directories-first --git -la"
else
    alias ls="ls --color=auto --group-directories-first"
    alias ll="ll --color=auto --group-directories-first -lh"
    alias la="la --color=auto --group-directories-first -A"
    alias lla="lla --color=auto --group-directories-first -lhA"
fi

alias grep="grep --color=auto"

[[ "$TERM" = "xterm-kitty" ]] && alias icat="kitten icat"
[[ -n "$WEZTERM_EXECUTABLE" ]] && alias icat="wezterm imgcat"
# ------------------------------------------------------------------------------

# PROMPT -----------------------------------------------------------------------
_add_newline() {
    [[ -z "$_should_add_newline" ]] && _should_add_newline=true || echo
}
PROMPT_COMMAND="_add_newline; $PROMPT_COMMAND"

PS1='\[\e[1m\]\[\e[34m\]\w\[\e[0m\]\$ '
# ------------------------------------------------------------------------------
