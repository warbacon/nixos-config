{ pkgs, ... }:
{
  fonts.packages = [
    pkgs.adwaita-fonts
    pkgs.cascadia-code
    pkgs.nerd-fonts.symbols-only
    pkgs.noto-fonts
    pkgs.noto-fonts-cjk-sans
    pkgs.noto-fonts-emoji
  ];

  fonts.fontconfig = {
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
      ];
      sansSerif = [ "Adwaita Sans" ];
      serif = [ "Noto Serif" ];
    };
  };
}
