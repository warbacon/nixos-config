{ lib, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    (zathura.override { useMupdf = true; })
    bluetui
    brightnessctl
    bun
    chromium
    cliphist
    dunst
    dust
    ear2ctl
    eza
    fastfetch
    fd
    gcc
    git
    grim
    hyperfine
    hypridle
    hyprlock
    hyprpaper
    hyprsunset
    killall
    kitty
    lazygit
    libreoffice-fresh
    localsend
    mpv
    neovim
    nodejs
    php
    phpPackages.composer
    pulsemixer
    python3
    ripgrep
    rofi-wayland
    rofimoji
    slurp
    starship
    steam-run-free
    tlrc
    trash-cli
    unzip
    waybar
    wget
    wl-clip-persist
    wl-clipboard
    yazi
    zip
  ];

  # Hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  environment.variables = {
    GDK_SCALE = 2;
  };

  # Shells
  programs.command-not-found.enable = false;
  programs.fish = {
    enable = true;
    useBabelfish = true;
    shellAliases = lib.mkForce { };
    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch --flake /home/warbacon/Git/nixos-config/";
    };
  };
  programs.bash = {
    loginShellInit = # bash
      ''
        if uwsm check may-start; then
          exec uwsm start hyprland-uwsm.desktop
        fi
      '';
  };

  # Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
  };

  # Nix-ld
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
    ];
  };

  # Warbacon user
  users.users.warbacon = {
    isNormalUser = true;
    description = "Joaquín Guerra";
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];
  };

  # Hostname
  networking.hostName = "zenarch";

  # Enable networking
  networking.networkmanager.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Printing
  services.printing = {
    enable = true;
    drivers = with pkgs; [ hplipWithPlugin ];
  };

  # Use PipeWire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  security.rtkit.enable = true;

  # PPD
  services.power-profiles-daemon.enable = true;

  # Docker
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };

  # Bootloader
  boot.loader.timeout = 0;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
