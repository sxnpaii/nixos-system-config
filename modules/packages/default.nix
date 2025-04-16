{ pkgs, ... }: {
  imports = [
    ./cli.nix
    ./desktop.nix
    ./dev.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  environment.systemPackages = with pkgs;
    [
      home-manager
      ibus
      gnome-tweaks
    ];
}
