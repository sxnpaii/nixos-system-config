disko --mode disko /mnt/etc/nixos/disko.nix
nixos-generate-config --root /mnt
nixos-install --root /mnt --flake /mnt/etc/nixos#myhost