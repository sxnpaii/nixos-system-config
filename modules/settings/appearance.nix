{ pkgs, home, ... }: {
  fonts.fontDir.enable = true;
  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    source-han-sans-japanese
    inter
    # nerdfonts.jetbrains-mono
    # nerdfonts.fira-code
    (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" ]; })
  ];
  qt = {
    enable = true;
    platformTheme = "gtk2";
  };
}

