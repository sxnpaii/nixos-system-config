{ ... }: {
  imports =
    [
      ./packages/default.nix
      ./services/default.nix
      ./settings/default.nix
      ./users/default.nix
      ./programs/default.nix
    ];
}
