{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    android-studio
    vscode
    postman
    tmux
    htop
    git
    android-tools
    vscode-extensions.b4dm4n.vscode-nixpkgs-fmt
    nixpkgs-fmt
    ngrok
    rustup
    go
    alacritty
    nodePackages_latest.vercel
    nodePackages_latest.nodejs
    nodePackages_latest.npm
  ];
}
