{
  pkgs,
  osConfig,
  lib,
  hostName,
  ...
}:
if (osConfig.this.desktop != null) then
  {
    imports = [
      ./kitty
      ./theming
      ./mpv
      ./zen.nix
    ];

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
      pkgs.legcord
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
  }
else
  { }
