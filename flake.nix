{
  description = "Wint3rmute's Flake Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    agenix = {
      url = "github:ryantm/agenix";
      inputs.darwin.follows = "nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    home-manager,
    agenix,
  }: {
    formatter = {
      aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.alejandra;
      x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    };

    darwinConfigurations."Mateuszs-MacBook-Air" = nix-darwin.lib.darwinSystem {
      specialArgs = {inherit inputs self;};
      modules = [
        agenix.darwinModules.default
        home-manager.darwinModules.home-manager
        ./modules/darwin/system.nix
        ./modules/darwin/hosts.nix
        ./modules/darwin/global_packages.nix
        ./modules/darwin/macos.nix
        ./modules/darwin/homebrew.nix
        ./modules/darwin/wireguard.nix
      ];
    };

    nixosConfigurations."asus" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        agenix.nixosModules.default
        home-manager.nixosModules.home-manager
        ./modules/nixos/configuration.nix
        ./modules/nixos/hardware.nix
        ./modules/nixos/wireguard.nix
      ];
    };
  };
}
