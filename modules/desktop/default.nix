{
  config,
  lib,
  pkgs,
  inputs,
  system,
  ...
}:
let
  cfg = config.desktop;
in
{
  imports = [
    ./wm
    ./plasma.nix
    ./gnome.nix
  ];
  options = {
    desktop = {
      enable = lib.mkEnableOption "Enable desktop module";
      profile = lib.mkOption {
        type = lib.types.enum [
          null
          "plasma"
          "gnome"
          "niri"
        ];
        default = null;
      };
    };
  };
  config = lib.mkIf cfg.enable {
    services.xserver.xkb.layout = "es";

    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };


    environment.systemPackages = [
      inputs.zen-browser.packages."${system}".default
      pkgs.mpv
      pkgs.steam-run-free
      pkgs.vscode-fhs
    ]
    ++ lib.optionals config.hardware.bluetooth.enable [
      pkgs.ear2ctl
    ];

    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    xdg = {
      terminal-exec = true;
      mime = {
        enable = true;
        defaultApplications = {
          "application/pdf" = [ "zen-beta.desktop" ];
          "text/html" = [ "zen-beta.desktop" ];
          "x-scheme-handler/http" = [ "zen-beta.desktop" ];
          "x-scheme-handler/https" = [ "zen-beta.desktop" ];
          "x-scheme-handler/mailto" = [ "zen-beta.desktop" ];
        };
      };
    };

    fonts = {
      packages = [
        pkgs.cascadia-code
        pkgs.adwaita-fonts
        pkgs.liberation_ttf
        pkgs.nerd-fonts.symbols-only
        pkgs.noto-fonts-color-emoji
      ];

      fontconfig = {
        enable = true;
        defaultFonts = {
          sansSerif = [ "Adwaita Sans" ];
          serif = [ "Liberation Serif" ];
          monospace = [
            "Cascadia Code"
            "Symbols Nerd Font"
            "Noto Color Emoji"
          ];
        };
      };
    };
  };
}
