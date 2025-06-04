{ pkgs, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      geist-font = import ../../../../packages/geist-font {
        inherit (prev) lib stdenvNoCC fetchzip;
      };
    })
  ];

  fonts.packages = [
    # (pkgs.ibm-plex.override { families = [ "mono" ]; })
    pkgs.adwaita-fonts
    pkgs.cascadia-code
    pkgs.geist-font
    pkgs.nerd-fonts.symbols-only
    pkgs.noto-fonts
    pkgs.noto-fonts-cjk-sans
    pkgs.noto-fonts-emoji
  ];

  fonts.fontconfig = {
    enable = true;
    localConf = # xml
      ''
        <alias>
            <family>Consolas</family>
            <prefer>
              <family>monospace</family>
            </prefer>
        </alias>
      '';
    defaultFonts = {
      emoji = [ "Noto Color Emoji" ];
      monospace = [
        "Geist Mono"
        "Symbols Nerd Font"
      ];
      sansSerif = [ "Geist" ];
      serif = [ "Noto Serif" ];
    };
  };
}
