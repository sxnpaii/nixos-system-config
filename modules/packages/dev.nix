{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    vscode
    postman
    tmux
    htop
    git
    vscode-extensions.b4dm4n.vscode-nixpkgs-fmt
    nixpkgs-fmt
    ngrok
    alacritty
    nodePackages_latest.vercel
    nodePackages_latest.nodejs
    nodePackages_latest.npm
    dart
    android-studio
    jdk
    flutter
    android-tools
  ];
}
