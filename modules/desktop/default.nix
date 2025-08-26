{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ./gnome.nix
    ./plasma.nix
  ];

  options = {
    this.desktop = lib.mkOption {
      default = "none";
      type = lib.types.str;
    };
  };

  config = lib.mkIf (config.this.desktop != "none") {
    # Fonts
    fonts = {
      packages = [
        pkgs.adwaita-fonts
        pkgs.cascadia-code
        pkgs.nerd-fonts.symbols-only
        pkgs.noto-fonts-cjk-sans
        pkgs.noto-fonts-color-emoji
      ];

      fontconfig = {
        enable = true;
        defaultFonts = {
          monospace = [
            "Cascadia Code"
            "Symbols Nerd Font"
            "Noto Color Emoji"
          ];
          sansSerif = [ "Adwaita Sans" ];
        };
      };
    };

    # Audio
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Needed to open the necessary firewall ports
    programs.localsend.enable = true;

    # For my HP printer
    services.printing = {
      drivers = [ pkgs.hplipWithPlugin ];
    };

    # X11 layout (also used in Wayland)
    services.xserver.xkb.layout = "es";
  };
}
