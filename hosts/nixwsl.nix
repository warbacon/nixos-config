{ hostname, ... }:
{
  imports = [
    ../modules/base
  ];

  wsl = {
    enable = true;
    defaultUser = "warbacon";
  };

  networking.hostName = hostname;
}
