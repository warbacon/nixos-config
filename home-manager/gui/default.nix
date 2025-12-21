{
  config,
  lib,
  osConfig,
  ...
}:
{
  imports = [
    ./foot
    ./vicinae
  ]
  ++ lib.optionals (osConfig.desktop.profile == "niri") [
    ./niri
  ];

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
