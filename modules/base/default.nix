{
  pkgs,
  hostName,
  lib,
  inputs,
  ...
}:
{
  # Cachix binary cache
  nix.settings = {
    substituters = [
      "https://walker.cachix.org"
      "https://nix-community.cachix.org"
      "https://cache.nixos.org/"
    ];
    trusted-public-keys = [
      "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  imports = [
    ./neovim.nix
    ./users.nix
    ./docker.nix
    ./fish.nix
  ];

  networking.hostName = hostName;

  time.timeZone = "Europe/Madrid";

  i18n = {
    defaultLocale = "es_ES.UTF-8";
    extraLocaleSettings = {
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
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # NIX_PATH
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  # Experimental features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Programs
  environment.systemPackages = [
    pkgs.fd
    pkgs.gcc
    pkgs.git
    pkgs.killall
    pkgs.ripgrep
    pkgs.tmux
    pkgs.unrar
    pkgs.unzip
    pkgs.wget
    pkgs.zip
    (pkgs.writeShellScriptBin "nrs" ''
      OLD="$(sudo nix-env -p /nix/var/nix/profiles/system --list-generations | tail -1 | awk '{print $1}')"
      sudo nixos-rebuild switch
      CURRENT="$(sudo nix-env -p /nix/var/nix/profiles/system --list-generations | tail -1 | awk '{print $1}')"

      if (( $OLD != $CURRENT )); then
        ${pkgs.nvd}/bin/nvd diff "/nix/var/nix/profiles/system-$OLD-link" "/nix/var/nix/profiles/system-$CURRENT-link"
      fi
    '')
  ];

  # Appimage support
  programs.appimage.enable = true;

  # Aliases
  environment.shellAliases = lib.mkForce {
    nrb = "sudo nixos-rebuild boot";
    # nrs = "sudo nixos-rebuild switch";
    nrt = "sudo nixos-rebuild test";
    rm = "rm -v";
    cp = "cp -iv";
    mv = "mv -iv";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
