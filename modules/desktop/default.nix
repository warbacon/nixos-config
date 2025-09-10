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
    ./hyprland.nix
    ./gaming.nix
  ];

  options = {
    this.desktop = lib.mkOption {
      default = null;
      type = lib.types.enum [
        null
        "gnome"
        "plasma"
        "hyprland"
      ];
      description = "The desktop environment to use.";
    };
  };

  config = lib.mkIf (config.this.desktop != null) {
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
        localConf = # xml
          ''
            <?xml version="1.0"?>
            <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
            <fontconfig>
              <alias>
                <family>Consolas</family>
                <prefer>
                  <family>monospace</family>
                </prefer>
              </alias>
            </fontconfig>
          '';
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

    # Enable Wayland in Chromium/Electron
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

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
