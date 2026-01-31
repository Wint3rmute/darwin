{
  config,
  lib,
  home,
  pkgs,
  ...
}: {
  programs.nushell = {
    enable = true;
  };
}
