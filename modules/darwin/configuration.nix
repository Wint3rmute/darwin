{
  pkgs,
  self,
  ...
}:
{
  home-manager = {
    users.wint3rmute = {
      imports = [
        ../shared/home_packages.nix
        ../shared/helix.nix
        ../shared/git.nix
        ./nushell.nix
      ];
      home.homeDirectory = "/Users/wint3rmute";
      home.stateVersion = "25.05";
    };
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  users.users.wint3rmute = {
    name = "wint3rmute";
    home = "/Users/wint3rmute";
    uid = 501;
    shell = pkgs.nushell;
  };

  system = {
    primaryUser = "wint3rmute";
    # Set Git commit hash for darwin-version.
    configurationRevision = self.rev or self.dirtyRev or null;
    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 6;
  };

  # for programs.zsh.enableCompletion. Comment in docs:
  # Enable zsh completion. Don't forget to add
  environment.pathsToLink = [ "/share/zsh" ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  nixpkgs.config.allowUnfree = true;
}
