{ pkgs, lib, ... }: {
  # set gpu
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };
  hardware.nvidia.modesetting.enable = true;
  # import complete setup
  nix.settings = {
    substituters = [ "https://nix-gaming.cachix.org" ];
    trusted-public-keys = [ "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" ];
  };
  # enable opengl
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  # power management to performance mode
  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  # configure GPU on offload mode
  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    # define GPUs
    # integrated
    intelBusId = "PCI:2:0:0";
    # dedicated
    nvidiaBusId = "PCI:1:0:0";
  };

  specialisation = {
    gaming-time.configuration = {
      hardware.nvidia = {
        prime.sync.enable = lib.mkForce true;
        prime.offload = {
          enable = lib.mkForce false;
          enableOffloadCmd = lib.mkForce false;
        };
      };
    };
  };
  # software apps/packages
  environment.systemPackages = with pkgs; [
    # gaming
    lutris
    winetricks
    dxvk
    mangohud
    auto-cpufreq
  ];
  # install and run steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

}
