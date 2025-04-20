{
  config,
  isWsl,
  lib,
  ...
}:
let
  home-config = config.home-manager.users.warbacon;
in
{
  imports =
    [
      ./btop.nix
      ./starship.nix
      ./git.nix
    ]
    ++ lib.optionals (!isWsl) [
      ./firefox.nix
      ./mimeapps.nix
      ./theming.nix
    ];

  home.username = "warbacon";
  home.homeDirectory = "/home/warbacon";
  home.stateVersion = "24.11";

  # XDG
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = null;
      music = null;
      templates = null;
      publicShare = null;
      documents = "${home-config.home.homeDirectory}/Documentos";
      download = "${home-config.home.homeDirectory}/Descargas";
      pictures = "${home-config.home.homeDirectory}/Descargas";
      videos = "${home-config.home.homeDirectory}/Vídeos";
    };
  };

  programs.home-manager.enable = true;
}
