{ lib, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bootloader
  boot.loader.timeout = 0;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname
  networking.hostName = "zenarch";

  # Enable networking
  networking.networkmanager.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;

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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.shellAliases = lib.mkForce {};

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    (zathura.override { useMupdf = true; })
    bluetui
    brightnessctl
    btop-rocm
    bun
    cliphist
    dunst
    dust
    eza
    fastfetch
    fd
    gcc
    git
    grim
    hyperfine
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
    nodejs_22
    php84
    php84Packages.composer
    pulsemixer
    python314
    ripgrep
    rofi-wayland
    rofimoji
    slurp
    starship
    tealdeer
    trash-cli
    unzip
    waybar
    wget
    wl-clip-persist
    wl-clipboard
    xdg-desktop-portal-gtk
    xdg-user-dirs
    yazi
    zip

    astro-language-server
    basedpyright
    bash-language-server
    clang-tools
    docker-compose-language-service
    dockerfile-language-server-nodejs
    emmet-language-server
    intelephense
    lua-language-server
    markdownlint-cli
    nixd
    nixfmt-rfc-style
    shellcheck-minimal
    stylua
    tailwindcss-language-server
    vscode-langservers-extracted
    vtsls
    yaml-language-server
  ];

  fonts.packages = with pkgs; [
    (ibm-plex.override { families = [ "mono" ]; })
    adwaita-fonts
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  programs.fish = {
    enable = true;
    package = pkgs.fishMinimal;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
  };

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-bin;
    languagePacks = [
      "es-ES"
      "en-US"
    ];
  };

  services.power-profiles-daemon.enable = true;
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };

  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
