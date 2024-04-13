{
  device ? throw "Device identifier, e.g. /dev/nvme0n1",
  ...
}: {
  disko.devices = {
    disk = {
      main = {
        inherit device;
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            esp = {
              name = "esp";
              priority = 1;
              type = "EF00";
              start = "1MiB";
              end = "512MiB";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/efi"; # systemd-boot advocates /efi over /boot and /boot/efi
              };
            };
            root = {
              name = "root";
              priority = 2;
              type = "8300";
              size = "100%";
              # start = "513MiB";
              # end = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                subvolumes = {
                  "/root" = {
                    mountOptions = [ "compress=zstd" "noatime" ];
                    mountpoint = "/";
                  };
                  "/home" = {
                    mountOptions = [ "compress=zstd" "noatime" ];
                    mountpoint = "/home";
                  };
                  "/nix" = {
                    mountOptions = [ "compress=zstd" "noatime" ];
                    mountpoint = "/nix";
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
