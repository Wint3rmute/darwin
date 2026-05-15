{pkgs, ...}: {
  # programs.nushell is not yet supported on nix-darwin, so config is managed via home.file
  home.file."Library/Application Support/nushell/config.nu".text =
    builtins.readFile ../shared/nushell/config.nu;
  home.file.".config/zoxide.nu".text = builtins.readFile ../shared/nushell/zoxide.nu;

  home.packages = with pkgs; [
    starship
  ];
}
