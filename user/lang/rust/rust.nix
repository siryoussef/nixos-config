<<<<<<< Updated upstream
{ pkgs, ... }:

{
  home.packages = with pkgs; [
      # Rust setup
      rustup
  ];
}
=======
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
      # Rust setup
      rustup
  ];
}
>>>>>>> Stashed changes
