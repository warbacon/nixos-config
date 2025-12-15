{
  imports = [
    ../../nixos/common
  ];

  wsl = {
    enable = true;
    defaultUser = "warbacon";
  };
}
