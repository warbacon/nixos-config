{
  imports = [
    ./hardware-configuration.nix
    ../../modules/desktop
    ../../nixos/common
    ../../nixos/system.nix
  ];

  # boot.loader.grub.enable = true;
  # boot.loader.grub.device = "/dev/sda";

  desktop = {
    enable = true;
    profile = "niri";
  };
}
