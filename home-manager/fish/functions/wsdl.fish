function wsdl --description "Run SDL applications with Wayland video driver"
    set -x SDL_VIDEODRIVER wayland
    if test -d /nix
        steam-run $argv[1]
    else
        command $argv[1]
    end
end
