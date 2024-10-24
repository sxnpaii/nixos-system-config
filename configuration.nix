{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./configs/styling.nix
    ];

  # Bootloader.
  boot.loader = {
    systemd-boot = {
      enable = true;
    };
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "nixos"; # Define hostname.
    networkmanager.enable = true; # Enable networking
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  };

  # Set your time zone.
  time.timeZone = "Asia/Tashkent";

  i18n = {
    # Select internationalisation properties.
    defaultLocale = "en_US.UTF-8";
    # add keyboard input 
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = [
        pkgs.fcitx5-mozc
        pkgs.fcitx5
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
      device = "/dev/nvme0n1p7";
    };
  };
  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
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

  # Install Firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };


  environment.systemPackages = with pkgs; [
    # applications
    obsidian
    brave
    google-chrome
    vlc
    telegram-desktop
    megasync
    spotify
    ventoy-full
    # development 
    android-studio
    vscode
    insomnia
    postman
    nodejs-slim
    nodePackages.npm
    tmux
    htop
    wget
    git
    tor
    android-tools
    libimobiledevice
    vscode-extensions.b4dm4n.vscode-nixpkgs-fmt
    nixpkgs-fmt
    # utils
    wine
    fcitx5
    fcitx5-mozc
  ];
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
