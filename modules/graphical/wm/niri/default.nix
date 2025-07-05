{ pkgs, ... }:
{
  programs.niri.enable = true;

  # Packages
  environment.systemPackages = [
    pkgs.xwayland-satellite
  ];

  home-manager.users.warbacon = {
    xdg.configFile."niri/config.kdl".source = ./config.kdl;

    systemd.user.services.xwayland-satellite = {
      Unit = {
        Description = "Auto-start xwayland-satellite in Niri";
        PartOf = [ "graphical-session.target" ];
        After = [ "niri.service" ];
        Requisite = [ "niri.service" ];
      };
      Service = {
        ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
      };
      Install.WantedBy = [ "graphical-session.target" ];
    };
  };
}
