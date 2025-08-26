{ hostName, inputs, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    extraSpecialArgs = {
      inherit hostName inputs;
    };
    users.warbacon = ./home.nix;
  };
}
