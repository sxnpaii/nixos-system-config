{
  disko.devices = {
    disk = {
      main-disk = {
        device = "/dev/nvme0n1";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              type = "EF00";
              size = "1G";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              size = "50%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
            sxnpaii_folder = {
              size = "50%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/mnt/sxnpaii_folder";
              };
            };
          };
        };
      };
    };
  };
}
