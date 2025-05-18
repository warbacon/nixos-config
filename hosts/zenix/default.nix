{
  imports = [
    ../../modules/base
    ../../modules/system
    ../../modules/graphical
    ./hardware-configuration.nix
  ];

  hardware.bluetooth.enable = true;
  services.printing.enable = true;

  services.tlp = {
    enable = true;
    settings = {
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_performance";
    };
  };
}
