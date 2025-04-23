{ pkgs, config, ... }: {

  imports = [ ./programs/default.nix ./packages/default.nix ];

  home = {
    username = "sxnpaii";
    homeDirectory = "/home/sxnpaii";
    stateVersion = "24.11";
    packages = with pkgs; [
      neofetch
      nightfox-gtk-theme
      papirus-icon-theme
      gruvbox-gtk-theme
    ];

    file.".themes/NightFox".source = pkgs.nightfox-gtk-theme;
    file.".themes/Gruvbox".source = pkgs.gruvbox-gtk-theme;
    file.".icons/Papirus".source = pkgs.papirus-icon-theme;
  };

  programs = { home-manager.enable = true; };

}
