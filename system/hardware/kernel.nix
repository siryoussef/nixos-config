<<<<<<< Updated upstream
{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.consoleLogLevel = 0;
  boot.extraModulePackages = with config.boot.kernelPackages; [
    zenpower
  ];
}
=======
{ config, lib, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.consoleLogLevel = 0;
  boot.extraModulePackages = with config.boot.kernelPackages; [
    zenpower
  ];
}
>>>>>>> Stashed changes
