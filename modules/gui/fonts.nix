{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      cascadia-code
      adwaita-fonts
      dejavu_fonts
      liberation_ttf
      nerd-fonts.symbols-only
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [
          "Cascadia Code"
          "Symbols Nerd Font"
        ];
        sansSerif = [ "Adwaita Sans" ];
        serif = [ "Liberation Serif" ];
      };
      localConf = # xml
        ''
          <?xml version="1.0"?>
          <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
          <fontconfig>
            <alias>
                <family>Segoe UI</family>
                <prefer>
                    <family>Adwaita Sans</family>
                </prefer>
            </alias>
            <alias>
                <family>Arial</family>
                <prefer>
                    <family>Liberation Sans</family>
                </prefer>
            </alias>
            <alias>
                <family>Verdana</family>
                <prefer>
                    <family>DejaVu Sans</family>
                </prefer>
            </alias>
          </fontconfig>
        '';
    };
  };
}
