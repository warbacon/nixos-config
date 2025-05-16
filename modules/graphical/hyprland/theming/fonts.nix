{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    adwaita-fonts
    (ibm-plex.override { families = [ "mono" ]; })
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
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
        "IBM Plex Mono"
        "Symbols Nerd Font"
      ];
      sansSerif = [ "Adwaita Sans" ];
      serif = [ "Noto Serif" ];
    };
  };
}
