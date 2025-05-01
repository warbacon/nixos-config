{ pkgs, ... }:
{
  users.users.warbacon = {
    isNormalUser = true;
    description = "Joaquín Guerra";
    shell = pkgs.fish;
    extraGroups = [
      "adbusers"
      "docker"
      "networkmanager"
      "wheel"
    ];
  };
}
