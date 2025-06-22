{ pkgs, ... }:
{
  fonts.packages = [
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
        "Cascadia Code"
        "Symbols Nerd Font"
        "Noto Color Emoji"
      ];
      sansSerif = [ "Geist" ];
      serif = [ "Noto Serif" ];
    };
  };
}
