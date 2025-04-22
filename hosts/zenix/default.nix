{
  imports = [
    ../../modules/base
    ../../modules/system
    ../../modules/graphical
    ./hardware-configuration.nix
  ];

  nixi.bluetooth.enable = true;
  services.printing.enable = true;
  networking.hostName = "zenix";

  services.tlp = {
    enable = true;
    settings = {
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_AC = "performance";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_performance";
    };
  };
}
