{ pkgs, ... }:
{

  home.packages = with pkgs; [
    (btop.override {
      rocmSupport = true;
    })
  ];
}
