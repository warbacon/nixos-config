{ pkgs, ... }:
{
  imports = [
    ./bottom.nix
    ./docker.nix
    ./git.nix
    ./neovim.nix
    ./starship.nix
  ];

  environment.systemPackages = with pkgs; [
    _7zz-rar
    dua
    eza
    fastfetch
    fd
    ffmpeg
    fzf
    gcc
    jq
    killall
    poppler
    resvg
    ripgrep
    tlrc
    trash-cli
    unzip
    wget
    xh
    yazi
    zip
    # NodeJS
    bun
    nodejs
    # Python
    python3
    # Php
    php
    phpPackages.composer
  ];

  home-manager.users.warbacon.xdg.desktopEntries = {
    nvim = {
      name = "nvim";
      noDisplay = true;
    };
    bottom = {
      name = "bottom";
      noDisplay = true;
    };
    nvtop = {
      name = "nvtop";
      noDisplay = true;
    };
    fish = {
      name = "fish";
      noDisplay = true;
    };
    uuctl = {
      name = "uuctl";
      noDisplay = true;
    };
    rofi = {
      name = "rofi";
      noDisplay = true;
    };
    rofi-theme-selector = {
      name = "rofi-theme-selector";
      noDisplay = true;
    };
  };
}
