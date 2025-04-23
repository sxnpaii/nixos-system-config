{ config, pkgs, lib, ... }:

{

  imports = [ ./hardware-configuration.nix ../../modules/default.nix ];
  # enable docker
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  system.stateVersion = "24.11";
}
