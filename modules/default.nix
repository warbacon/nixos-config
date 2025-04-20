{
  pkgs,
  config,
  lib,
  ...
}:
{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./bootloader.nix
    ./compat.nix
    ./networking.nix
    ./printing.nix
    ./shell.nix
    ./users.nix
    ./virtualisation.nix
    ./desktop.nix

    ./programs
  ];

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    bun
    dust
    eza
    fastfetch
    fd
    fzf
    gcc
    git
    killall
    neovim
    nodejs
    php
    phpPackages.composer
    python3
    ripgrep
    tlrc
    trash-cli
    unzip
    wget
    yazi
    zip
  ];

  # Home manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.warbacon = import ./home-manager {
      inherit config pkgs lib;
      isWsl = config.wsl.enable;
    };
  };

  # Garbage collector
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };

  # Experimental features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Timezone
  time.timeZone = "Europe/Madrid";

  # Locale
  i18n.defaultLocale = "es_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "es";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
