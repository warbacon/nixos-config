{ config, pkgs, ... }:
{
  home.username = "warbacon";
  home.homeDirectory = "/home/warbacon";
  home.stateVersion = "24.11";

  programs.git = {
    enable = true;
    userName = "Joaquín Guerra";
    userEmail = "45147327+warbacon@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  programs.gh.enable = true;

  programs.bash = {
    enable = true;
    profileExtra = # bash
      ''
        if uwsm check may-start; then
          exec uwsm start hyprland-uwsm.desktop
        fi
      '';
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  gtk = {
    enable = true;
    font = {
      name = "Adwaita Sans";
      size = 10;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = null;
      music = null;
      templates = null;
      publicShare = null;
      documents = "${config.home.homeDirectory}/Documentos";
      download = "${config.home.homeDirectory}/Descargas";
      pictures = "${config.home.homeDirectory}/Descargas";
      videos = "${config.home.homeDirectory}/Vídeos";
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = [
          "org.pwmt.zathura.desktop"
          "firefox.desktop"
        ];
      };
    };
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [ "Adwaita Sans" ];
      monospace = [
        "IBM Plex Mono"
        "Symbols Nerd Font"
      ];
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:none";
    };
  };

  programs.home-manager.enable = true;
}
