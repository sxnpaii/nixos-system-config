{ ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        import = [ "~/.config/alacritty/themes/themes/night_owl.toml" ];
      };
      font = {
        normal = {
          family = "JetBrains Mono";
          style = "Regular";
        };
        size = 12;
      };
      window = {
        opacity = 0.9;
        blur = true;
      };
      cursor = {
        style = "Underline";
      };
    };
  };
}
