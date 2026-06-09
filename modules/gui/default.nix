{ inputs, pkgs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  imports = [
    ./kitty
    ./mpv
    ./niri.nix
    ./fonts.nix
  ];

  services.xserver.xkb.layout = "es";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  hardware.graphics.enable32Bit = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    inputs.helium.packages."${system}".default
    inputs.zen-browser.packages."${system}".default
    steam-run
  ];
  programs.localsend.enable = true;

  home-manager.users.warbacon = {
    home.pointerCursor = {
      enable = true;
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      size = 24;
      name = "Bibata-Modern-Ice";
    };

    gtk = {
      enable = true;
      colorScheme = "dark";
      font = {
        name = "Adwaita Sans";
        size = 10;
      };
      iconTheme = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
      };
      gtk2.enable = false;
    };

    xdg = {
      enable = true;
      terminal-exec.enable = true;
      userDirs = {
        enable = true;
        setSessionVariables = false;
        createDirectories = true;
        desktop = "$HOME/";
        documents = "$HOME/Documentos";
        download = "$HOME/Descargas";
        music = "$HOME/";
        pictures = "$HOME/Imágenes";
        projects = "$HOME/Proyectos";
        publicShare = "$HOME/";
        templates = "$HOME/";
        videos = "$HOME/Vídeos";
      };
    };
  };
}
