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

    xdg.terminal-exec.enable = true;

    environment.systemPackages = [
      inputs.zen-browser.packages."${system}".default
      pkgs.vscode-fhs
    ]
    ++ lib.optionals config.hardware.bluetooth.enable [
      pkgs.ear2ctl
    ];

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    fonts = {
      packages = [
        pkgs.adwaita-fonts
        pkgs.googlesans-code
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
            "Google Sans Code"
            "Symbols Nerd Font"
            "Noto Color Emoji"
          ];
        };
      };
    };
  };
}
