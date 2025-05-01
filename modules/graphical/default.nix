{
  imports = [
    ./hyprland
    ./audio.nix
    ./theming.nix
    ./mimeapps.nix
    ./programs
  ];

  home-manager.users.warbacon.xdg.desktopEntries = {
    alacritty-open = {
      name = "alacritty-open";
      exec = "alacritty --working-directory %U";
      mimeType = [ "inode/directory" ];
      noDisplay = true;
    };
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
