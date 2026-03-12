{
  config,
  lib,
  home,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    alejandra
    awscli2
    ansible
    btop
    deno
    duf
    entr
    fastfetch
    ffmpeg
    fzf
    graphviz
    lilypond-unstable
    jdk
    # mpv
    ncdu
    nil
    neovim
    nmap
    nodejs
    # poetry
    rustup
    tinymist
    tmux
    typescript-language-server
    typst
    tldr
    uv
    # yt-dlp
    zola
    zoxide
  ];
}
