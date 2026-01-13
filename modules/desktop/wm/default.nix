{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.desktop;
in
{
  imports = [
    ./niri.nix
  ];

  config = lib.mkIf (cfg.profile == "niri" || cfg.profile == "hyprland") {
    services.gvfs.enable = true;

    environment.systemPackages = [
      pkgs.brightnessctl
      pkgs.foot
      pkgs.fuzzel
      pkgs.loupe
      pkgs.nautilus
      pkgs.papers
      pkgs.pulsemixer
    ]
    ++ lib.optionals config.hardware.bluetooth.enable [
      pkgs.bluetui
    ];

    xdg.mime.defaultApplications = {
      "image/png" = [ "org.gnome.Loupe.desktop" ];
      "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
      "image/gif" = [ "org.gnome.Loupe.desktop" ];
      "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
    };

    programs.dconf = {
      enable = true;
      profiles.user.databases = [
        {
          settings."org/gnome/desktop/wm/preferences".button-layout = "appmenu:none";
        }
      ];
    };
  };
}
