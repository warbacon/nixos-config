{ den, ... }:
{
  den.aspects.zenix = {
    includes = [
      den.aspects.common
      den.aspects.dev
      den.aspects.gui
      den.aspects.system
    ];

    nixos =
      { pkgs, ... }:
      {
        imports = [ ../hosts/zenix/hardware-configuration.nix ];

        services.power-profiles-daemon.enable = true;
        hardware.bluetooth.enable = true;

        nixpkgs.config.android_sdk.accept_license = true;
        environment.systemPackages = with pkgs; [
          obs-studio
          onlyoffice-desktopeditors

          android-studio
          dotnetCorePackages.sdk_10_0-bin
          lmstudio
          mono
          unityhub
          vscode-fhs
        ];
      };
  };
}
