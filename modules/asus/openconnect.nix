{ pkgs, config, ... }:
{
  age.secrets.openconnect = {
    file = ../../secrets/openconnect.age;
    path = "/etc/openconnect.conf";
    owner = "root";
    mode = "600";
  };

  systemd.services.openconnect = {
    enable = true;
    after = [ "network-online.target" ];
    wantedBy = [ ]; # No autostart, that's desired
    description = "Openconnect VPN";
    serviceConfig = {
      Type = "simple";
      RemainAfterExit = "no";
      ExecStart = ''${pkgs.bash}/bin/bash -c 'echo "$PASSWORD" | ${pkgs.openconnect}/bin/openconnect --protocol="$PROTOCOL" $FLAGS --user="$USERNAME" "$GATEWAY"' '';
      Restart = "always";
      RestartSec = "5s";
      EnvironmentFile = config.age.secrets.openconnect.path;
    };
  };

  environment.systemPackages = with pkgs; [
    openconnect
  ];
}
