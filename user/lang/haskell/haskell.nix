<<<<<<< Updated upstream
{ pkgs, ... }:

{
  home.packages = with pkgs; [
      # Haskell
      haskellPackages.haskell-language-server
      haskellPackages.stack
  ];
}
=======
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
      # Haskell
      haskellPackages.haskell-language-server
      haskellPackages.stack
  ];
}
>>>>>>> Stashed changes
