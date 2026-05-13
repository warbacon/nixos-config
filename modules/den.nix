{
  inputs,
  lib,
  den,
  ...
}:
{
  imports = [ inputs.den.flakeModule ];

  den.hosts.x86_64-linux = {
    zenix.users.warbacon = { };
    desktop.users.warbacon = { };
    vm.users.warbacon = { };

    wsl = {
      wsl.enable = true;
      users.warbacon = { };
    };
  };

  den.schema.user.classes = lib.mkDefault [ "homeManager" ];

  den.default = {
    includes = [
      den.batteries.hostname
      den.batteries.define-user
    ];

    nixos = {
      imports = [ inputs.nix-index-database.nixosModules.default ];
      system.stateVersion = "25.11";
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "bak";
      };
    };

    homeManager.home.stateVersion = "25.11";
  };
}
