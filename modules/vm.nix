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
        boot.loader.systemd-boot.enable = false;
        boot.loader.limine = {
          enable = true;
          style.wallpapers = lib.mkForce [ ];
        };

        virtualisation.vmware.guest.enable = true;

        networking.hostName = "vm";
      };
  };
}
