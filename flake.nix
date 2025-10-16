{
  description = "Wint3rmute's Flake Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    home-manager,
  }: let
    configuration = {
      pkgs,
      home-manager,
      ...
    }: {
      home-manager.users.wint3rmute = {
        imports = [
          ./modules/home_packages.nix
          ./modules/helix.nix
          ./modules/git.nix
        ];
        home.homeDirectory = "/Users/wint3rmute";
        home.stateVersion = "25.05";
      };

      users.users.wint3rmute = {
        name = "wint3rmute";
        home = "/Users/wint3rmute";
      };

      # for programs.zsh.enableCompletion. Comment in docs:
      # Enable zsh completion. Don’t forget to add
      environment.pathsToLink = ["/share/zsh"];

      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      nixpkgs.config.allowUnfree = true;
    };
  in {
    formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.alejandra;
    darwinConfigurations."Mateuszs-MacBook-Air" = nix-darwin.lib.darwinSystem {
      modules = [
        home-manager.darwinModules.home-manager
        configuration
        ./modules/global_packages.nix
      ];
    };
  };
}
