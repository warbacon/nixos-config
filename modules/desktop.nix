{ den, ... }:
{
  den.aspects.desktop = {
    includes = [
      den.aspects.common
      den.aspects.dev
      den.aspects.gui
      den.aspects.system
    ];

    nixos.networking.hostName = "desktop";
  };
}
