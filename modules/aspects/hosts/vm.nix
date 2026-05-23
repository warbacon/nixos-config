{ den, ... }:
{
  den.aspects.vm = {
    includes = [
      den.aspects.common
      den.aspects.dev
      den.aspects.gui
      den.aspects.system
    ];

    nixos =
      { lib, ... }:
      {
        imports = [ ../../../hosts/vm/hardware-configuration.nix ];

        boot.loader.systemd-boot.enable = false;
        boot.loader.limine = {
          enable = true;
          efiSupport = false;
          style.wallpapers = lib.mkForce [ ];
        };

        virtualisation.vmware.guest.enable = true;
      };
  };
}
