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
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [
        # pkgs.darwin.xcode
        # ghostty # TODO: check if available on aarch64
        btop
        fzf
        duf
        git
        neovim
        openfortivpn
        openconnect
        nmap
        tmux
        rectangle
        vscode
      ];
      users.users.wint3rmute = {
        name = "wint3rmute";
        home = "/Users/wint3rmute";
      };

      # https://nix-community.github.io/home-manager/options.xhtml
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.wint3rmute = {
        home.homeDirectory = "/Users/wint3rmute";
        home.stateVersion = "25.05";
        home.packages = with pkgs; [
          # signal-desktop
          alejandra
          cargo
          deno
          mpv
          gcc
          fastfetch
          entr
          nodejs
        ];
        programs.zsh.enable = true;
        programs.zsh.oh-my-zsh = {
          enable = true;
          plugins = ["git" "sudo"];
          theme = "robbyrussell";
        };
        programs.helix = import ./apps/helix.nix;
        programs.git = import ./apps/git.nix;
      };

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
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Mateuszs-MacBook-Air
    darwinConfigurations."Mateuszs-MacBook-Air" = nix-darwin.lib.darwinSystem {
      modules = [
        home-manager.darwinModules.home-manager
        configuration
      ];
    };
  };
}
