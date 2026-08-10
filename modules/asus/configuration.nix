{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.wint3rmute = {
    isNormalUser = true;
    description = "Mateusz Bączek";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.nushell;
  };

  # Install firefox.
  programs = {
    firefox.enable = true;
    neovim.enable = true;
    steam.enable = true;
    gamemode.enable = true;
    nix-ld.enable = true;
    kdeconnect = {
      enable = true; # opens firewall ports
      package = pkgs.gnomeExtensions.gsconnect; # use GSConnect instead of plain kdeconnect
    };
  };

  # Enable graphics acceleration
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    amdgpu_top
    audacity
    blender
    discord
    ghostty
    gimp
    git
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnumake
    gradia
    helix
    keepassxc
    nextcloud-client
    nushell
    pciutils
    signal-desktop
    spotify
    telegram-desktop
    uutils-coreutils-noprefix
    vlc
    wget
    wireguard-tools
    zed-editor
  ];

  home-manager = {
    users.wint3rmute = {
      imports = [
        ../shared/home_packages.nix
        ../shared/helix.nix
        ../shared/git.nix
        ./mpv.nix
        ./nushell.nix
      ];
      home.homeDirectory = "/home/wint3rmute";
      home.stateVersion = "25.05";
    };
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  security.sudo.extraRules = [
    {
      users = [ "wint3rmute" ];
      commands = [
        {
          command = "/run/current-system/sw/bin/nixos-rebuild";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/nix-collect-garbage";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/wg-quick";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

  networking.hostName = "asus"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "pl2";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  services = {
    # ollama = {
    #   enable = true;
    #   package = pkgs.ollama-rocm;
    # };
    # Enable the X11 windowing system.
    flatpak.enable = true;
    xserver = {
      enable = true;
      # Configure keymap in X11
      xkb = {
        layout = "pl";
        variant = "";
      };
    };
    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    # Enable sound with pipewire.
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
    # Enable the OpenSSH daemon.
    openssh.enable = true;
  };

  age.identityPaths = [ "/home/wint3rmute/.ssh/id_ed25519" ];

  # I don't want a slow PC when updating in the background
  nix.settings.max-jobs = 1;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  boot = {
    # Bootloader.
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
