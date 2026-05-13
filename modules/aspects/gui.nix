{ inputs, den, ... }:
{
  den.aspects.gui = {
    includes = [
      den.aspects.audio
    ];

    nixos =
      {
        pkgs,
        lib,
        ...
      }:
      let
        system = pkgs.stdenv.hostPlatform.system;
      in
      {
        services.xserver.xkb.layout = "es";

        services.displayManager.gdm.enable = true;
        services.desktopManager.gnome.enable = true;
        services.gnome = {
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

        hardware.graphics.enable32Bit = true;
        environment.systemPackages = with pkgs; [
          alacritty
          inputs.helium.packages."${system}".default
          inputs.zen-browser.packages."${system}".default
          mpv
          obs-studio
          (discord.override { withOpenASAR = true; })

          ffmpegthumbnailer
          file-roller
          gnome-characters
          gnome-disk-utility
          gnome-themes-extra
          loupe
          nautilus
          papers
          gnomeExtensions.copyous
          gnomeExtensions.appindicator
          gnomeExtensions.grand-theft-focus
        ];

        fonts = {
          enableDefaultPackages = false;
          packages = with pkgs; [
            ioskeley-mono.normal-unhinted
            adwaita-fonts
            dejavu_fonts
            liberation_ttf
            nerd-fonts.symbols-only
            noto-fonts-cjk-sans
            noto-fonts-color-emoji
          ];

          fontconfig = {
            enable = true;
            defaultFonts = {
              monospace = [
                "Ioskeley Mono"
                "Symbols Nerd Font"
                "Noto Color Emoji"
              ];
              sansSerif = [ "Adwaita Sans" ];
              serif = [ "Liberation Serif" ];
            };
            localConf =
              # xml
              ''
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
      };
    homeManager =
      { pkgs, ... }:
      {
        dconf.settings = {
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
          "org/gnome/desktop/peripherals/trackball" = {
            accel-profile = "flat";
          };
          "org/gnome/desktop/peripherals/mouse" = {
            accel-profile = "flat";
          };
        };

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
  };
}
