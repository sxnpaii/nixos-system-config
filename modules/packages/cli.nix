{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    scrcpy
    act
  ];
}
