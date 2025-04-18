{ config, pkgs, ... }:
{
  home.username = "warbacon";
  home.homeDirectory = "/home/warbacon";
  home.stateVersion = "24.11";

  # Packages
  home.packages = with pkgs; [
    adwaita-fonts
    lilex
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];

  # Theming
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
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = [ "Noto Color Emoji" ];
      monospace = [
        "Lilex"
        "Symbols Nerd Font"
      ];
      sansSerif = [ "Adwaita Sans" ];
      serif = [ "Noto Serif" ];
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

  # Git
  programs.git = {
    enable = true;
    userName = "Joaquín Guerra";
    userEmail = "45147327+warbacon@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  programs.gh.enable = true;

  # Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
    extraPackages = with pkgs; [
      astro-language-server
      basedpyright
      bash-language-server
      clang-tools
      docker-compose-language-service
      dockerfile-language-server-nodejs
      emmet-language-server
      intelephense
      lua-language-server
      markdownlint-cli
      nixd
      nixfmt-rfc-style
      shellcheck-minimal
      stylua
      tailwindcss-language-server
      vscode-langservers-extracted
      vtsls
      yaml-language-server
    ];
  };

  # Btop
  programs.btop = {
    enable = true;
    package = pkgs.btop-rocm;
    settings = {
      color_theme = "tokyo-night";
      rounded_corners = false;
      update_ms = 1000;
      vim_keys = true;
    };
  };

  # Firefox
  programs.firefox = {
    enable = true;
    languagePacks = [ "es-ES" ];
    policies = {
      DisableTelemetry = true;
      DisablePocket = true;
      DisableFirefoxStudies = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      RequestedLocales = "es-ES";
      ExtensionSettings = {
        "es-es@dictionaries.addons.mozilla.org" = {
          install_url = "addons.mozilla.org/firefox/downloads/latest/diccionario-de-español-españa/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };

  # XDG
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
        "text/html" = [ "firefox.desktop" ];
        "x-scheme-handler/http" = [ "firefox.desktop" ];
        "x-scheme-handler/https" = [ "firefox.desktop" ];
      };
    };
  };

  programs.home-manager.enable = true;
}
