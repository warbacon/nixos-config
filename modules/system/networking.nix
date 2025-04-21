{ hostname, ... }:
{
  networking = {
    networkmanager.enable = true;
    hostName = hostname;
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
  };

  services.resolved.enable = true;
}
