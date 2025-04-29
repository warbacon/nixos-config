# INPUTRC ----------------------------------------------------------------------
bind -s "set completion-ignore-case on"
bind -s "set colored-stats on"
# ------------------------------------------------------------------------------

# OPTIONS ----------------------------------------------------------------------
shopt -s autocd
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

alias rm="rm -v"
alias mv="mv -iv"
alias cp="cp -iv"

command_exists trash \
    && alias rt="trash" \
    || echo "WARNING: trash-cli is not installed."

command_exists lazygit && alias lg="lazygit"
[[ "$TERM" = "xterm-kitty" ]] && alias icat="kitten icat"
[[ -n "$WEZTERM_EXECUTABLE" ]] && alias icat="wezterm imgcat"
# ------------------------------------------------------------------------------

# PROMPT -----------------------------------------------------------------------
_add_newline() {
    [[ -z "$_should_add_newline" ]] && _should_add_newline=true || echo
}
PROMPT_COMMAND="_add_newline; $PROMPT_COMMAND"

PS1='\[\e[1m\]\[\e[34m\]\w\[\e[0m\]\$ '

if command_exists starship; then
    [[ -d "$HOME/.cache/starship" ]] || mkdir -p "$HOME/.cache/starship"

    if [[ ! -f "$HOME/.cache/starship/init.sh" ]]; then
        starship init bash --print-full-init >"$HOME/.cache/starship/init.sh"
        starship completions bash >>"$HOME/.cache/starship/init.sh"
    fi

    [[ "$TERM" != "linux" ]] && source "$HOME/.cache/starship/init.sh"
fi
# ------------------------------------------------------------------------------
