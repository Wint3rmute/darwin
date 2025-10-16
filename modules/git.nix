{
  config,
  lib,
  home,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userEmail = "mateusz.baczek1998@gmail.com";
    userName = "wint3rmute";
    delta.enable = true;
    extraConfig = {
      push.autoSetupRemote = true;
    };
  };
}
