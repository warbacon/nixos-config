{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    cliphist
    rofi-wayland
    rofimoji
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
  };
}
