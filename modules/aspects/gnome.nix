{
  den.aspects.gnome = {
    nixos =
      { pkgs, lib, ... }:
      {
        services.displayManager.gdm.enable = true;
        services.desktopManager.gnome.enable = true;
        services.gnome = {
          core-apps.enable = false;
          evolution-data-server.enable = lib.mkForce false;
        };

        environment = {
          gnome.excludePackages = with pkgs; [
            gnome-tour
            gnome-user-docs
            orca
          ];
          systemPackages = with pkgs; [
            ffmpegthumbnailer
            file-roller
            gnome-characters
            gnome-disk-utility
            loupe
            nautilus
            papers
            gnomeExtensions.copyous
            gnomeExtensions.appindicator
            gnomeExtensions.grand-theft-focus
          ];
          sessionVariables = {
            NAUTILUS_4_EXTENSION_DIR = "${pkgs.nautilus-python}/lib/nautilus/extensions-4";
          };
        };

        programs.nautilus-open-any-terminal = {
          enable = true;
          terminal = "kitty";
        };
      };
    homeManager = {
      dconf.settings = {
        "org/gnome/desktop/wm/keybindings" = {
          close = [ "<Super>C" ];
          switch-to-workspace-right = [ "<Control><Super>Right" ];
          switch-to-workspace-left = [ "<Control><Super>Left" ];
          move-to-workspace-right = [ "<Shift><Control><Super>Right" ];
          move-to-workspace-left = [ "<Shift><Control><Super>Left" ];
          toggle-fullscreen = [ "<Super>f" ];
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
    };
  };
}
