{
  networking = {
    # firewall.enable = false;
    networkmanager = {
      enable = true;
      insertNameservers = [
        "1.1.1.1"
        "1.0.0.1"
      ];
    };
  };
}
