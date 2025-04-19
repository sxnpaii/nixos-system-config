{ ... }: {
  users.users.sxnpaii = {
    isNormalUser = true;
    description = "Abdulxayev Xurshid";
    extraGroups = [ "networkmanager" "wheel" "adbusers" ];
  };
}
