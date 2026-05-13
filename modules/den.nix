{ inputs, lib, ... }:
{
  imports = [ inputs.den.flakeModule ];

  den.hosts.x86_64-linux = {
    zenix.users.warbacon = { };
    desktop.users.warbacon = { };
    vm.users.warbacon = { };

    wsl = {
      wsl = { };
      users.warbacon = { };
    };
  };

  den.default = {
    nixos = {
      imports = [ inputs.nix-index-database.nixosModules.default ];
      system.stateVersion = "25.11";
    };

    homeManager.home.stateVersion = "25.11";
  };

  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
}
