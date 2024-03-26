<<<<<<< Updated upstream
{ pkgs, ... }:

{
  home.packages = with pkgs; [
      # CC
      gcc
      gnumake
      cmake
      autoconf
      automake
      libtool
  ];
}
=======
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
      # CC
      gcc
      gnumake
      cmake
      autoconf
      automake
      libtool
  ];
}
>>>>>>> Stashed changes
