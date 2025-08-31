{
  osConfig,
  config,
  lib,
  ...
}:
{
  imports = [
    ./cli
  ]
  ++ lib.optionals (osConfig.this.desktop != null) [
    ./gui
  ];

  xdg.userDirs =
    let
      homeDir = config.home.homeDirectory;
    in
    {
      enable = true;
      createDirectories = true;

      desktop = null;
      music = null;
      publicShare = null;

      documents = "${homeDir}/Documentos";
      download = "${homeDir}/Descargas";
      pictures = "${homeDir}/Imágenes";
      templates = "${homeDir}/Plantillas";
      videos = "${homeDir}/Vídeos";
    };

  home = {
    preferXdgDirectories = true;
    stateVersion = osConfig.system.stateVersion;
  };
}
