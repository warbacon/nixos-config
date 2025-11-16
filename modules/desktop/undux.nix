{ system, inputs, ... }:
{
  systemd.user.services.undux = {
    description = "Undux service";

    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "${inputs.undux.packages.${system}.default}/bin/undux";
      Restart = "on-failure";
      RestartSec = 5;
    };
  };
}
