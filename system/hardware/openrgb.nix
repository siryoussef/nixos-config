<<<<<<< Updated upstream
{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.openrgb-with-all-plugins ];

  # OpenRGB setup
  services.hardware.openrgb = {
    enable = true;
    motherboard = "amd";
  };
}
=======
{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.openrgb-with-all-plugins ];

  # OpenRGB setup
  services.hardware.openrgb = {
    enable = true;
    motherboard = "amd";
  };
}
>>>>>>> Stashed changes
