function fish_command_not_found
    set -l cmd (string escape -- $argv[1])
    printf "%b\n" (string join "" \
        (set_color red --bold) "ERROR:" (set_color normal) \
        " command \e[58:5:1m\e[4:3m" $cmd "\e[59m\e[24m not found.")
end
