{
  programs.nh = {
    enable = true;
    flake = "/home/warbacon/Git/nixos-config";
    clean = {
      enable = true;
      extraArgs = "--keep 5 --keep-since 3d";
      dates = "daily";
    };
  };
}
