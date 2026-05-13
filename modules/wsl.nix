{ den, inputs, ... }:
{
  den.aspects.wsl = {
    includes = [
      den.aspects.common
      den.aspects.dev
    ];

    nixos = {
      imports = [ inputs.nixos-wsl.nixosModules.default ];

      wsl = {
        enable = true;
        defaultUser = "warbacon";
      };

      networking.hostName = "wsl";
    };
  };
}
