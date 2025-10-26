{
  pkgs,
  osConfig,
  lib,
  config,
  ...
}:
{
  imports = [
    ./foot
    ./theming
    ./mpv
    ./zen.nix
  ]
  ++ lib.optionals (osConfig.this.desktop == "hyprland" || osConfig.this.desktop == "niri") [
    ./wm
  ];

  # Packages
  home.packages = [
    pkgs.jetbrains.idea-community
    pkgs.vscode-fhs
  ]
  ++ lib.optionals osConfig.this.gaming.enable [
    pkgs.gamescope
    pkgs.steam-run-free
  ]
  ++ lib.optionals osConfig.this.gaming.maincra [
    (pkgs.prismlauncher.override { jdks = [ pkgs.jdk21 ]; })
  ]
  ++ lib.optionals (osConfig.this.gaming.enable && !osConfig.this.gaming.nativeOnly) [
    (pkgs.bottles.override { removeWarningPopup = true; })
  ];

  programs.chromium = {
    enable = true;
    package = pkgs.google-chrome;
    commandLineArgs = [
      "--enable-features=TouchpadOverscrollHistoryNavigation"
      "-no-default-browser-check"
    ];
  };

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
          "footclient.desktop"
          "kitty.desktop"
          "ghostty.desktop"
          "alacritty.desktop"
          "wezterm.desktop"
        ];
      };
    };
  };

  # Enable Wayland in Chromium/Electron
  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
