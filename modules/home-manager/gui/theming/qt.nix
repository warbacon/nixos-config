{
  pkgs,
  lib,
  osConfig,
  ...
}:
{
  config = lib.mkIf (osConfig.this.desktop != "plasma") {
    home.packages = [ pkgs.kdePackages.breeze-icons ];

    qt = {
      enable = true;
      platformTheme.name = "qtct";
    };

    xdg.configFile."qt6ct/qt6ct.conf".text = lib.generators.toINI { } {
      Appearance = {
        color_scheme_path = "${pkgs.kdePackages.qt6ct}/share/qt6ct/colors/darker.conf";
        custom_palette = true;
        icon_theme = "breeze-dark";
      };
      Fonts = {
        fixed = "\"monospace,11,-1,5,50,0,0,0,0,0,Regular\"";
        general = "\"sans-serif,11,-1,5,50,0,0,0,0,0\"";
      };
      Interface = {
        dialog_buttons_have_icons = 0;
        toolbutton_style=0;
        underline_shortcut = 0;
      };
    };

    xdg.configFile."qt5ct/qt5ct.conf".text = lib.generators.toINI { } {
      Appearance = {
        color_scheme_path = "${pkgs.libsForQt5.qt5ct}/share/qt5ct/colors/darker.conf";
        custom_palette = true;
        icon_theme = "breeze-dark";
      };
      Fonts = {
        fixed = "\"monospace,11,-1,5,50,0,0,0,0,0,Regular\"";
        general = "\"sans-serif,11,-1,5,50,0,0,0,0,0\"";
      };
      Interface = {
        dialog_buttons_have_icons = 0;
        toolbutton_style=0;
        underline_shortcut = 0;
      };
    };
  };
}
