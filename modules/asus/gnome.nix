{ pkgs, ... }:
let
  gsConnectPackage = pkgs.gnomeExtensions.gsconnect;
  gnomeExtensions = with pkgs.gnomeExtensions; [
    appindicator
    blur-my-shell
    dash-to-dock
    gsConnectPackage
  ];
in
{
  programs = {
    kdeconnect = {
      enable = true;
      package = gsConnectPackage;
    };
  };

  environment.systemPackages = gnomeExtensions;

  programs.dconf.profiles.user.databases = [
    {
      settings = {
        "org/gnome/shell" = {
          enabled-extensions = map (ext: ext.extensionUuid) gnomeExtensions;
        };
      };
    }
  ];
}
