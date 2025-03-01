{ pkgs
, lib
, ...
}: {
  fonts.fontDir.enable = true;
  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    source-han-sans-japanese
    inter
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];
}
