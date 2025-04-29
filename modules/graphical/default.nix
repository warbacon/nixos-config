{
  imports = [
    ./hyprland
    ./audio.nix
    ./theming.nix
    ./mimeapps.nix
    ./programs
  ];

  home-manager.users.warbacon.xdg.desktopEntries = {
    nvim = {
      name = "nvim";
      noDisplay = true;
    };
    fish = {
      name = "fish";
      noDisplay = true;
    };
    uuctl = {
      name = "uuctl";
      noDisplay = true;
    };
    rofi = {
      name = "rofi";
      noDisplay = true;
    };
    rofi-theme-selector = {
      name = "rofi-theme-selector";
      noDisplay = true;
    };
  };
}
