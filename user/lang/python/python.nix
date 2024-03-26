<<<<<<< Updated upstream
{ pkgs, ... }:

{
  home.packages = with pkgs; [
      # Python setup
      python3Full
      imath
      pystring
  ];
}
=======
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
      # Python setup
      python3Full
      imath
      pystring
  ];
}
>>>>>>> Stashed changes
