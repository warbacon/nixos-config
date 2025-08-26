{
  pkgs,
  hostName,
  lib,
  inputs,
  ...
}:
{
  imports = [
    ./neovim.nix
    ./users.nix
    ./docker.nix
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

  # Cachix binary cache
  nix.settings = {
    trusted-substituters = [
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  # Programs
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "7z" ''exec ${pkgs._7zz-rar}/bin/7zz "$@"'')
    pkgs.fd
    pkgs.gcc
    pkgs.git
    pkgs.killall
    pkgs.ripgrep
    pkgs.tmux
    pkgs.unzip
    pkgs.wget
  ];

  # Aliases
  environment.shellAliases = lib.mkForce {
    nrb = "sudo nixos-rebuild boot";
    nrs = "sudo nixos-rebuild switch";
    nrt = "sudo nixos-rebuild test";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
