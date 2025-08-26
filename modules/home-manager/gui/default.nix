{ pkgs, inputs, ... }:
{
  imports = [
    ./kitty
    ./theming
  ];

  # Packages
  home.packages = [
    inputs.zen-browser.packages.${pkgs.system}.default

    pkgs.chafa
    pkgs.chromium
    pkgs.mpv
    pkgs.wl-clipboard
  ];

  # Default applications
  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = [ "zen.desktop" ];
        "text/html" = [ "zen.desktop" ];
        "x-scheme-handler/http" = [ "zen.desktop" ];
        "x-scheme-handler/https" = [ "zen.desktop" ];
        "x-scheme-handler/mailto" = [ "zen.desktop" ];
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
