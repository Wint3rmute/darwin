{pkgs, ...}:
{
  programs = {
    niri.enable = true;
    hyprland.enable = true;
    dms-shell = {
      enable = true;
      systemd.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    fuzzel
  ];
}

