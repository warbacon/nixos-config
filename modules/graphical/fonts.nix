{ pkgs, ... }:
{
  fonts.packages = [
    pkgs.adwaita-fonts
    pkgs.iosevka-bin
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
        "Iosevka"
        "Symbols Nerd Font"
        "Noto Color Emoji"
      ];
      sansSerif = [ "Adwaita Sans" ];
      serif = [ "Noto Serif" ];
    };
  };
}
