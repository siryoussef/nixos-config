<<<<<<< Updated upstream
{ pkgs, ... }:

{
  # Feral GameMode
  environment.systemPackages = [ pkgs.gamemode ];
  programs.gamemode.enable = true;
}
=======
{ config, pkgs, ... }:

{
  # Feral GameMode
  environment.systemPackages = [ pkgs.gamemode ];
  programs.gamemode.enable = true;
}
>>>>>>> Stashed changes
