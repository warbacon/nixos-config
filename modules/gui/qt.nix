{ pkgs, ... }:
{
  home-manager.users.warbacon = {
    home.packages = with pkgs; [
      kdePackages.breeze-icons
    ];

    qt = {
      enable = true;
      platformTheme.name = "kde";
      style.name = "breeze";
    };

    home.file.".config/kdeglobals".text = ''
      ${builtins.readFile "${pkgs.kdePackages.breeze}/share/color-schemes/BreezeDark.colors"}

      [General]
      font=Sans Serif,10,-1,5,50,0,0,0,0,0
      menuFont=Sans Serif,10,-1,5,50,0,0,0,0,0
      windowFont=Sans Serif,10,-1,5,50,0,0,0,0,0
      toolbarFont=Sans Serif,10,-1,5,50,0,0,0,0,0
      smallestReadableFont=Sans Serif,8,-1,5,50,0,0,0,0,0
      fixed=Monospace,10,-1,5,50,0,0,0,0,0

      [Icons]
      Theme=breeze-dark
    '';
  };
}
