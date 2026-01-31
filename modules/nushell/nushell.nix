{
  config,
  lib,
  home,
  pkgs,
  ...
}: {
  home.file."Library/Application Support/nushell/config.nu".text = builtins.readFile ./config.nu;
  home.file.".config/zoxide.nu".text = builtins.readFile ./zoxide.nu;

  home.packages = with pkgs; [
    starship
  ];
}
