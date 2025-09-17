{
  pkgs,
  osConfig,
  lib,
  hostName,
  config,
  ...
}:
{
  imports = [
    ./kitty
    ./theming
    ./mpv
    ./zen.nix
    # ./ghostty.nix
  ]
  ++ lib.optionals (osConfig.this.desktop == "hyprland") [
    ./hyprland
  ];

  # Packages
  home.packages = [
    pkgs.chromium
  ]
  ++ lib.optionals osConfig.this.gaming.enable [
    pkgs.gamescope
    pkgs.steam-run-free
  ]
  ++ lib.optionals (osConfig.this.gaming.enable && !osConfig.this.gaming.nativeOnly) [
    pkgs.bottles
  ]
  ++ lib.optionals (hostName != "nixvm") [
    pkgs.discord
  ];

  # Default applications
  xdg = {
    userDirs =
      let
        homeDir = config.home.homeDirectory;
      in
      {
        enable = true;
        createDirectories = true;

        desktop = null;
        music = null;
        publicShare = null;

        documents = "${homeDir}/Documentos";
        download = "${homeDir}/Descargas";
        pictures = "${homeDir}/Imágenes";
        templates = "${homeDir}/Plantillas";
        videos = "${homeDir}/Vídeos";
      };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = [ "zen-beta.desktop" ];
        "text/html" = [ "zen-beta.desktop" ];
        "x-scheme-handler/http" = [ "zen-beta.desktop" ];
        "x-scheme-handler/https" = [ "zen-beta.desktop" ];
        "x-scheme-handler/mailto" = [ "zen-beta.desktop" ];
      };
    };
    terminal-exec = {
      enable = true;
      settings = {
        default = [
          "kitty.desktop"
          "ghostty.desktop"
          "footclient.desktop"
          "alacritty.desktop"
          "wezterm.desktop"
        ];
      };
    };
  };

  # Enable Wayland in Chromium/Electron
  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
