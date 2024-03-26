<<<<<<< Updated upstream
{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    alacritty
  ];
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    window.opacity = lib.mkForce 0.75;
  };
}
=======
{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    alacritty
  ];
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    window.opacity = lib.mkForce 0.65;
  };
}
>>>>>>> Stashed changes
