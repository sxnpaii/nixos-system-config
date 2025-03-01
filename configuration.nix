{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./configs/styling.nix
    ];

  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "SxnpaiiNixos"; # Define hostname.
    networkmanager.enable = true; # Enable networking
    # wireless.enable = true; # Enables wireless support via wpa_supplicant.
  };

  # Set your time zone.
  time.timeZone = "Asia/Tashkent";

  i18n = {
    # Select internationalisation properties.
    defaultLocale = "en_US.UTF-8";
    # add keyboard input 
    inputMethod = {
      type = "ibus";
      ibus.engines = with pkgs.ibus-engines; [
        mozc
      ];
    };
  };
  # Enable the X11 windowing system.
  services = {
    xserver = {
      enable = true;
      # Enable the GNOME Desktop Environment.
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      # Configure keymap in X11
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    # Enable CUPS to print documents.
    printing.enable = true;
    # Other services
    flatpak.enable = true;
  };

  # Automount second partition
  fileSystems = {
    "/mnt/sxnpaii_folder" = {
      device = "/dev/nvme0n1p6";
    };
  };
  security.rtkit.enable = true;
  services = {
    # Enable sound with pipewire.
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  # services.xserver.libinput.enable = true; 
  # Defining a user account.
  users.users.sxnpaii = {
    isNormalUser = true;
    description = "Abdulxayev Xurshid";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      #  thunderbird
    ];
  };
  nix = {
    # garbage collection
    gc = {
      automatic = true;
      dates = "daily";
    };
    # enabling flakes and nix command
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  # Install Firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
  environment.systemPackages = with pkgs;
    [
      # nixos packages
      home-manager
      # applications
      obsidian
      brave
      google-chrome
      vlc
      telegram-desktop
      megasync
      spotify
      ventoy-full
      libreoffice
      # development 
      android-studio
      vscode
      postman
      tmux
      htop
      git
      android-tools
      vscode-extensions.b4dm4n.vscode-nixpkgs-fmt
      nixpkgs-fmt
      ngrok
      rustup
      go
      alacritty
      scrcpy
      # node
      nodePackages_latest.vercel
      nodePackages_latest.nodejs
      nodePackages_latest.npm
      # styles langs
      ibus
      gnome-tweaks
    ];
  # enable docker
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };


  # other apps with specific options
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  system.stateVersion = "24.05";
}
