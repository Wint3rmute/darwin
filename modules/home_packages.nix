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
    rustup
    deno
    entr
    fastfetch
    graphviz
    mpv
    neovim
    nodejs
    poetry
    typescript-language-server
    typst
    zola
    zoxide
    tinymist
  ];
}
