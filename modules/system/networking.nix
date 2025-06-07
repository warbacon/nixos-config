{
  services.resolved = {
    enable = true;
    dnssec = "allow-downgrade";
  };

  networking = {
    firewall.enable = false;
    networkmanager = {
      dns = "systemd-resolved";
      enable = true;
    };
    nameservers = [
      "1.1.1.1#cloudflare-dns.com"
      "1.0.0.1#cloudflare-dns.com"
    ];
  };
}
