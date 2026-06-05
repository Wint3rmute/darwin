# Global apps
{ pkgs, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # nushell's in global_packages because it's
    # set as the root user's default shell
    nushell
    openconnect
    ripgrep
    sd
    uutils-coreutils-noprefix
    wireguard-tools
  ];
}
