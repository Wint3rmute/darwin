{
  config,
  lib,
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
    fd
    graphviz
    lilypond-unstable
    jdk
    # mpv
    ncdu
    nil
    neovim
    nmap
    nodejs
    ollama
    # poetry
    pre-commit
    rustup
    tinymist
    tmux
    typescript-language-server
    typst
    tldr
    tree
    uv
    yt-dlp
    zola
    zoxide
  ];
}
