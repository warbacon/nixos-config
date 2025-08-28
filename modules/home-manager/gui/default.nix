{
  pkgs,
  osConfig,
  lib,
  hostName,
  ...
}:
{
  imports = [
    ./kitty
    ./theming
    ./mpv.nix
    ./zen.nix
  ];

  config = lib.mkIf (osConfig.this.desktop != "none") {
    # Packages
    home.packages = [
      pkgs.chromium
      pkgs.wl-clipboard
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
  };
}
