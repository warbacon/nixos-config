{
  imports = [
    ./adb.nix
    ./bluetooth.nix
    ./bootloader.nix
    ./printing.nix
    ./networking.nix
  ];

  zramSwap.enable = true;
}
