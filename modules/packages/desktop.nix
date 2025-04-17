{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    obsidian
    brave
    google-chrome
    vlc
    telegram-desktop
    megasync
    spotify
    ventoy-full
    libreoffice
    anki
    firefox
  ];
}
