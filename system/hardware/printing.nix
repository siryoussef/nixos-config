<<<<<<< Updated upstream
{ pkgs, ... }:

{
  # Enable printing
  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  services.avahi.openFirewall = true;
  environment.systemPackages = [ pkgs.cups-filters ];
}
=======
{ config, pkgs, ... }:

{
  # Enable printing
  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.avahi.openFirewall = true;
  environment.systemPackages = [ pkgs.cups-filters ];
}
>>>>>>> Stashed changes
