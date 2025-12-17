{
  config,
  lib,
  inputs,
  system,
  ...
}:
let
  cfg = config.desktop;
in
{
  imports = [
    ./wm
    ./plasma.nix
    ./gnome.nix
  ];
  options = {
    desktop = {
      enable = lib.mkEnableOption "Enable desktop module";
      profile = lib.mkOption {
        type = lib.types.enum [
          null
          "plasma"
          "gnome"
          "niri"
        ];
        default = null;
      };
    };
  };
  config = lib.mkIf cfg.enable {
    services.xserver.xkb.layout = "es";

    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    xdg.terminal-exec.enable = true;

    environment.systemPackages = [
      inputs.zen-browser.packages."${system}".default
    ];
  };
}
