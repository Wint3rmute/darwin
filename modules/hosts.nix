{
  config,
  lib,
  ...
}: let
  # Collect all extra hosts from different modules
  extraHosts = lib.concatStringsSep "\n" config.networking.extraHostsLines;
in {
  options.networking.extraHostsLines = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [];
    description = "Additional lines to add to /etc/hosts";
    example = [
      "# Comment about what this part blocks"
      "127.0.0.1 host.you.want.blocked.com"
    ];
  };

  config.environment.etc."hosts" = {
    # Use default macOS hosts contents by default
    text = ''
      ##
      # Host Database
      #
      # localhost is used to configure the loopback interface
      # when the system is booting.  Do not change this entry.
      ##
      127.0.0.1       localhost
      255.255.255.255 broadcasthost
      ::1             localhost

      ${extraHosts}
    '';
  };
}
