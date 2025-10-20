{
  config,
  lib,
  home,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    alejandra
    ansible
    cargo
    deno
    entr
    fastfetch
    mpv
    neovim
    nodejs
    poetry
    rust-analyzer
    typescript-language-server
    zoxide
  ];
}
