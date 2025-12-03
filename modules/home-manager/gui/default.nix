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
    pkgs.obs-studio
    pkgs.vscode-fhs
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
          "Alacritty.desktop"
          "wezterm.desktop"
        ];
      };
    };
  };

  # Enable Wayland in Chromium/Electron
  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
