{ ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        WINIT_UNIX_BACKEND = "wayland"; # or "wayland" if you're sure it's supported
      };
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
      cursor = { style = "Underline"; };
    };
  };
}
