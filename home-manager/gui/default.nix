{
  config,
  lib,
  osConfig,
  ...
}:
{
  imports = [
    ./foot
  ]
  ++ lib.optionals (osConfig.desktop.profile == "niri") [
    ./niri
  ];

  programs.vicinae = {
    enable = true;
    systemd.enable = true;
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
