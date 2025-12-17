{
  imports = [
    ../../modules/desktop
    ../../nixos/common
  ];

  wsl = {
    enable = true;
    defaultUser = "warbacon";
  };
}
