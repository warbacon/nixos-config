{
  pkgs,
  lib,
  system,
  inputs,
  ...
}:

{
  imports = [
    ./neovim.nix
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://vicinae.cachix.org"
      "https://nix-community.cachix.org"
      "https://cache.nixos.org/"
    ];
    trusted-public-keys = [
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    trusted-users = [
      "root"
      "@wheel"
    ];
  };
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Madrid";

  i18n.defaultLocale = "es_ES.UTF-8";

  users.users.warbacon = {
    isNormalUser = true;
    description = "Joaquín Guerra";
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    extraSpecialArgs = {
      inherit system inputs;
    };
    users.warbacon = ../../home-manager/home.nix;
  };

  virtualisation.docker = {
    enable = lib.mkDefault true;
    enableOnBoot = false;
  };

  programs.fish = {
    enable = true;
    useBabelfish = true;
  };
  documentation.man.generateCaches = false;

  environment.systemPackages = with pkgs; [
    btop-rocm
    chafa
    dust
    eza
    fastfetch
    fd
    fzf
    gcc
    git
    hyperfine
    killall
    libqalculate
    ripgrep
    tlrc
    tmux
    trash-cli
    unrar
    unzip
    wget
    xdg-utils
    (writeShellScriptBin "nrs" ''
      OLD="$(sudo nix-env -p /nix/var/nix/profiles/system --list-generations | tail -1 | awk '{print $1}')"
      sudo nixos-rebuild switch
      CURRENT="$(sudo nix-env -p /nix/var/nix/profiles/system --list-generations | tail -1 | awk '{print $1}')"

      if (( $OLD != $CURRENT )); then
        ${pkgs.dix}/bin/dix "/nix/var/nix/profiles/system-$OLD-link" "/nix/var/nix/profiles/system-$CURRENT-link"
      fi
    '')
    # Development
    bun
    jdk21
    nodejs
  ];

  system.stateVersion = "25.11";
}
