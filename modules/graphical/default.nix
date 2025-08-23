{
  imports = [
    ./wm
    ./fonts.nix
    ./gaming.nix
    ./mimeapps.nix
    ./programs
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  security.rtkit.enable = true;
}
