{
  description = "Development flake of Sxnpaii";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      config = {
        allowUnfree = true;
      };
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        modules = [
          ./configuration.nix
        ];
      };
      packages.${system} = {
        ngrok = pkgs.ngrok;
        go = pkgs.go;
      };
      devShells.${system}.default =
        pkgs.mkShell
          {
            packages = with pkgs; [
              python3
            ];
            shellHook = ''
              echo "Hello nixshell"
            '';
          };
    };
}
