<<<<<<< Updated upstream
{ pkgs, ... }:

{
  hardware.opengl.driSupport32Bit = true;
  programs.steam.enable = true;
  environment.systemPackages = [ pkgs.steam ];
}
=======
{ config, pkgs, ... }:

{
  hardware.opengl.driSupport32Bit = true;
  programs.steam.enable = true;
  environment.systemPackages = [ pkgs.steam ];
}
>>>>>>> Stashed changes
