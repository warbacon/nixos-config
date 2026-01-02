{
  imports = [
    ./hardware-configuration.nix
    ../../modules/desktop
    ../../nixos/common
    ../../nixos/system.nix
  ];

  services.tlp.enable = true;
  hardware.bluetooth.enable = true;

  services.printing = {
    enable = true;
    webInterface = true;
  };

  desktop = {
    enable = true;
    profile = "niri";
  };
}
