{
  pkgs,
  inputs,
  ...
}: {
  home-manager.users.wint3rmute = {
    imports = [
      ../shared/home_packages.nix
      ../shared/helix.nix
      ../shared/git.nix
      ./nushell.nix
    ];
    home.homeDirectory = "/home/wint3rmute";
    home.stateVersion = "25.05";
  };

  users.users.wint3rmute = {
    isNormalUser = true;
    home = "/home/wint3rmute";
    shell = pkgs.nushell;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  environment.systemPackages = with pkgs; [
    inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
    nushell
    openconnect
    ripgrep
    sd
    uutils-coreutils-noprefix
    wireguard-tools
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "asus";
  networking.networkmanager.enable = true;

  # Locale
  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "25.05";
}
