{ pkgs, ... }:
{
  home-manager.users.warbacon = {
    home.packages = [
      pkgs.kdePackages.breeze-icons
    ];
    qt = {
      enable = true;
      platformTheme.name = "qtct";
      qt6ctSettings = {
        Appearance = {
          color_scheme_path = "${pkgs.qt6Packages.qt6ct}/share/qt6ct/colors/darker.conf";
          icon_theme = "breeze-dark";
          standard_dialogs = "xdgdesktopportal";
          custom_palette = true;
          style = "Fusion";
        };
        Fonts = {
          fixed = "\"Monospace,10,-1,0,400,0,0,0,0,0,0,0,0,0,0,1,,0,0\"";
          general = "\"Sans Serif,10,-1,0,400,0,0,0,0,0,0,0,0,0,0,1,,0,0\"";
        };
        Interface = {
          toolbutton_style = 0;
        };
      };
    };
  };
}
