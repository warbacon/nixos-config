{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.cliphist
    pkgs.rofimoji
  ];

  home-manager.users.warbacon = {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      extraConfig = {
        drun-display-format = "{name}";
        cycle = false;
        hover-selected = true;
        display-drun = "Aplicaciones";
      };
      theme = ./themes/tokyonight.rasi;
    };
    services.cliphist.enable = true;

    xdg.desktopEntries = {
      rofi = {
        name = "rofi";
        noDisplay = true;
      };
      rofi-theme-selector = {
        name = "rofi-theme-selector";
        noDisplay = true;
      };
    };
  };
}
