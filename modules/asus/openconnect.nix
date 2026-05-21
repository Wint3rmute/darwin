{ pkgs, ... }:
{
  systemd.services.my-cool-user-service = {
    enable = true;
    after = [ "network.target" ];
    wantedBy = [ "default.target" ];
    description = "Openconnect VPN";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.openconnect}/bin/openconnect -h";
    };
  };

  environment.systemPackages = with pkgs; [
    openconnect
  ];
}
