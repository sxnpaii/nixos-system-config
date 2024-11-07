{ pkgs
, lib
, ...
}: {
  fonts.fontDir.enable = true;
  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk
    source-han-sans-japanese
    inter
    (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" ]; })
  ];
}
