{ pkgs, ... }: {

  home.packages = with pkgs;
    [
      scrcpy
      act
    ];
}
