{ ... }: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "SxnpaiiNixos";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Tashkent";


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
  fileSystems = {
    "/mnt/sxnpaii_folder" = {
      device = "/dev/nvme0n1p6";
    };
  };
}

