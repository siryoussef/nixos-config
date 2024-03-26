<<<<<<< Updated upstream
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Android
    android-tools
    android-udev-rules
  ];
}
=======
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Android
    android-tools
    android-udev-rules
  ];
}
>>>>>>> Stashed changes
