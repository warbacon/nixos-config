{
  config,
  pkgs,
  lib,
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
      "https://nix-community.cachix.org"
      "https://cache.nixos.org/"
    ];
    trusted-public-keys = [
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

  virtualisation.docker = {
    enable = lib.mkDefault true;
    enableOnBoot = true;
  };

  programs.fish = {
    enable = true;
    useBabelfish = true;
  };
  documentation.man.generateCaches = false;

  environment.systemPackages = with pkgs; [
    dust
    fastfetch
    fd
    gcc
    gh
    git
    lazygit
    ripgrep
    unzip
  ];

  system.stateVersion = "25.11";
}
