{
  imports = [
    ./hardware-configuration.nix
    ../../modules/desktop
    ../../nixos/common
    ../../nixos/system.nix
  ];

  services.tlp.enable = true;
  hardware.bluetooth.enable = true;

  desktop = {
    enable = true;
    profile = "niri";
  };
}
