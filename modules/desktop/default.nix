{
  pkgs,
  lib,
  config,
  system,
  inputs,
  ...
}:
{
  imports = [
    ./gnome.nix
    ./plasma.nix
    ./cosmic.nix
    ./gaming.nix
    ./wm

    inputs.undug.nixosModules.${system}.default
  ];

  options = {
    this.desktop = lib.mkOption {
      default = null;
      type = lib.types.enum [
        null
        "cosmic"
        "gnome"
        "plasma"
        "hyprland"
        "niri"
      ];
      description = "The desktop environment to use.";
    };
  };

  config = lib.mkIf (config.this.desktop != null) {
    # Fonts
    fonts = {
      packages = [
        pkgs.googlesans-code
        pkgs.cascadia-code
        pkgs.inter
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
            "Google Sans Code"
            "Symbols Nerd Font"
            "Noto Color Emoji"
          ];
          sansSerif = [ "Inter" ];
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

    # The GOAT
    services.undug.enable = true;

    # For my HP printer
    services.printing = {
      drivers = [ pkgs.hplipWithPlugin ];
    };

    # X11 layout (also used in Wayland)
    services.xserver.xkb.layout = "es";
  };
}
