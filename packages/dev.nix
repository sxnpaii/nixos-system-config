{ pkgs, ... }: {

  home.packages = with pkgs; [
    vscode
    postman
    tmux
    htop
    git
    vscode-extensions.b4dm4n.vscode-nixpkgs-fmt
    nixpkgs-fmt
    ngrok
    nodePackages.vercel
    nodePackages.nodejs
    nodePackages.npm
  ];
}
