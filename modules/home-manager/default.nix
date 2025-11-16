{
  hostName,
  inputs,
  system,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    extraSpecialArgs = {
      inherit inputs hostName system;
    };
    users.warbacon = ./home.nix;
  };
}
