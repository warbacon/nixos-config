{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  Kvantum-Tokyo-Night = pkgs.fetchFromGitHub {
    owner = "0xsch1zo";
    repo = "Kvantum-Tokyo-Night";
    rev = "82d104e0047fa7d2b777d2d05c3f22722419b9ee";
    hash = "sha256-Uy/WthoQrDnEtrECe35oHCmszhWg38fmDP8fdoXQgTk=";
    sparseCheckout = [ "Kvantum-Tokyo-Night" ];
  };

  qtctConf = {
    Appearance = {
      custom_palette = false;
      icon_theme = "breeze-dark";
      standard_dialogs = "xdgdesktopportal";
      style = "kvantum";
    };
    Fonts = {
      fixed = "\"monospace,10,-1,5,50,0,0,0,0,0,Regular\"";
      general = "\"sans-serif,10,-1,5,50,0,0,0,0,0\"";
    };
    Interface = {
      underline_shortcut = 0;
    };
  };
in
{
  config = lib.mkIf (osConfig.this.desktop != "plasma") {
    qt = {
      enable = true;
      platformTheme.name = "qtct";
    };

    home.packages = [
      pkgs.qt6Packages.qtstyleplugin-kvantum
      pkgs.libsForQt5.qtstyleplugin-kvantum
      pkgs.libsForQt5.qt5ct
      pkgs.kdePackages.breeze-icons
    ];

    xdg.configFile = {
      "Kvantum/Kvantum-Tokyo-Night" = {
        source = "${Kvantum-Tokyo-Night}/Kvantum-Tokyo-Night";
        recursive = true;
      };
      "Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=Kvantum-Tokyo-Night
      '';

      "qt6ct/qt6ct.conf".text = lib.generators.toINI { } qtctConf;
      "qt5ct/qt5ct.conf".text = lib.generators.toINI { } qtctConf;
    };
  };
}
