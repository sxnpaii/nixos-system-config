{ pkgs, ... }: {
  home.packages = with pkgs; [
    obsidian
    brave
    google-chrome
    vlc
    telegram-desktop
    megasync
    ventoy-full
    libreoffice
    anki
    firefox
  ];
}
