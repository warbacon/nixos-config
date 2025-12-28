{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  imports = [
    ./foot
    ./vicinae
    ./mpv.nix
  ]
  ++ lib.optionals (osConfig.desktop.profile == "niri") [
    ./niri
  ];

  programs.chromium = {
    enable = true;
    package = pkgs.google-chrome;
    commandLineArgs = [
      "--enable-features=TouchpadOverscrollHistoryNavigation"
      "-no-default-browser-check"
    ];
  };

  xdg.userDirs = {
    enable = true;
    desktop = "${config.home.homeDirectory}/Escritorio";
    pictures = "${config.home.homeDirectory}/Imágenes";
    videos = "${config.home.homeDirectory}/Vídeos";
    documents = "${config.home.homeDirectory}/Documentos";
    download = "${config.home.homeDirectory}/Descargas";
    publicShare = null;
    templates = null;
    music = null;
  };
}
