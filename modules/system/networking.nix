{
  services.resolved.enable = true;
  networking = {
    firewall.enable = false;
    networkmanager = {
      dns = "systemd-resolved";
      enable = true;
    };
    nameservers = [
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
    ];
  };
}
