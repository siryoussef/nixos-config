<<<<<<< Updated upstream
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    blueman
  ];
  services = {
    blueman-applet.enable = true;
  };
}
=======
{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    blueman
  ];
  services = {
    blueman-applet.enable = true;
  };
}
>>>>>>> Stashed changes
