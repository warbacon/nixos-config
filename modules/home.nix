{ inputs, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    users.warbacon = {
      home.stateVersion = "25.11";
      home.username = "warbacon";
      home.homeDirectory = "/home/warbacon";
      home.preferXdgDirectories = true;

      programs.bash = {
        enable = true;
        initExtra = # bash
          ''
          source <(fzf --bash)
        '';
      };
    };
  };
}
