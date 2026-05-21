{ pkgs, ... }:
{
  systemd.user.services.my-cool-user-service = {
    enable = true;
    after = [ "network.target" ];
    wantedBy = [ "default.target" ];
    description = "My Cool User Service";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.bash}/bin/bash echo works";
    };
  };

  environment.systemPackages = with pkgs; [
    openconnect
  ];
}
