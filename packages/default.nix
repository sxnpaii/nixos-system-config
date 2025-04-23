{ pkgs, ... }: {
  imports = [ ./cli.nix ./desktop.nix ./dev.nix ];

  nixpkgs = { config = { allowUnfree = true; }; };

  home.packages = with pkgs; [ ibus gnome-tweaks ];
}
