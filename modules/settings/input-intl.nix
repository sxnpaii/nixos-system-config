{ pkgs, ... }: {

  services.xserver.xkb = {
    layout = "us,ru,jp";
    variant = ",phonetic,kana";
    options = "grp:alt_shift_toggle";
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enable = true;
      type = "ibus";
      ibus.engines = with pkgs.ibus-engines; [
        mozc
      ];
    };
  };

}
