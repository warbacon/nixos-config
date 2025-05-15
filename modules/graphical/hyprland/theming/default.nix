{ pkgs, ... }:
{
  imports = [
    ./fonts.nix
    ./gtk.nix
    ./qt.nix
  ];

  home-manager.users.warbacon = {
    home.pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
  };
}
