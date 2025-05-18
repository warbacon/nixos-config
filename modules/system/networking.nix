{
  networking = {
    networkmanager = {
      enable = true;
      # wifi.backend = "iwd";
    };
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
    firewall = {
      allowedTCPPorts = [
        80
        5173
      ];
    };
  };
}
