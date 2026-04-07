{
  inputs,
  system,
  pkgs,
  lib,
  ...
}:

{
  services.xserver.xkb.layout = "es";

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gnome = {
    sushi.enable = true;
    core-apps.enable = false;
    evolution-data-server.enable = lib.mkForce false;
  };

  environment = {
    sessionVariables = {
      NAUTILUS_4_EXTENSION_DIR = "${pkgs.nautilus-python}/lib/nautilus/extensions-4";
      NIXOS_OZONE_WL = "1";
    };
    gnome.excludePackages = with pkgs; [
      gnome-tour
      gnome-user-docs
      orca
    ];
  };

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "alacritty";
  };

  programs.localsend.enable = true;
  programs.niri.enable = true;

  hardware.graphics.enable32Bit = true;

  environment.systemPackages = with pkgs; [
    bibata-cursors

    alacritty
    faugus-launcher
    inputs.helium.packages."${system}".default
    inputs.zen-browser.packages."${system}".default
    mpv
    obs-studio
    onlyoffice-desktopeditors
    vesktop

    fuzzel
    mako

    ffmpegthumbnailer
    file-roller
    fragments
    gnome-characters
    gnome-disk-utility
    gnome-themes-extra
    loupe
    nautilus
    papers

    gnomeExtensions.copyous
    gnomeExtensions.appindicator

    unityhub
    vscode-fhs
  ];

  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      adwaita-fonts
      dejavu_fonts
      cascadia-code
      liberation_ttf
      nerd-fonts.symbols-only
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [
          "Cascadia Code"
          "Symbols Nerd Font"
          "Noto Color Emoji"
        ];
        sansSerif = [ "Adwaita Sans" ];
        serif = [ "Liberation Serif" ];
      };
      localConf = ''
        <?xml version="1.0"?>
        <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
        <fontconfig>
          <alias>
              <family>Segoe UI</family>
              <prefer>
                  <family>Adwaita Sans</family>
              </prefer>
          </alias>
          <alias>
              <family>Arial</family>
              <prefer>
                  <family>Liberation Sans</family>
              </prefer>
          </alias>
          <alias>
              <family>Verdana</family>
              <prefer>
                  <family>DejaVu Sans</family>
              </prefer>
          </alias>
        </fontconfig>
      '';
    };
  };

  programs.dconf = {
    enable = true;
    profiles.user.databases = [
      {
        settings = {
          "org/gnome/desktop/wm/keybindings" = {
            close = [ "<Super>C" ];
            switch-to-workspace-right = [ "<Control><Super>Right" ];
            switch-to-workspace-left = [ "<Control><Super>Left" ];
            move-to-workspace-right = [ "<Shift><Control><Super>Right" ];
            move-to-workspace-left = [ "<Shift><Control><Super>Left" ];
            toggle-fullscreen = [ "<Super>f" ];
          };
          "org/gnome/settings-daemon/plugins/media-keys" = {
            custom-keybindings = [
              "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
            ];
          };
          "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
            binding = "<Super>q";
            command = "bash -c \"alacritty msg create-window || alacritty\"";
            name = "Alacritty";
          };
          "org/gnome/desktop/wm/preferences" = {
            resize-with-right-button = true;
          };
          "org/gnome/desktop/interface" = {
            cursor-theme = "Bibata-Modern-Ice";
            color-scheme = "prefer-dark";
            gtk-theme = "Adwaita-dark";
          };
          "org/gnome/desktop/peripherals/trackball" = {
            accel-profile = "flat";
          };
          "org/gnome/desktop/peripherals/mouse" = {
            accel-profile = "flat";
          };
        };
      }
    ];
  };

  xdg.terminal-exec.enable = true;

  environment.etc."xdg/user-dirs.defaults".text = ''
    DESKTOP=Escritorio
    DOWNLOAD=Descargas
    TEMPLATES=
    PUBLICSHARE=
    DOCUMENTS=Documentos
    MUSIC=
    PICTURES=Imágenes
    VIDEOS=Vídeos
  '';
}
