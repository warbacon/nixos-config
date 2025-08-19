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
        cycle = false;
        display-drun = "Aplicaciones";
        drun-display-format = "{name}";
        hover-selected = true;
        run-command = "app2unit -- {cmd}";
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
