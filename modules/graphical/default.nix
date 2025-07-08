{
  imports = [
    ./wm
    ./programs
    ./gaming.nix
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  security.rtkit.enable = true;
}
