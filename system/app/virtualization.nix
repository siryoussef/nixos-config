<<<<<<< Updated upstream
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ virt-manager virtualbox distrobox ];
  virtualisation.libvirtd = {
    allowedBridges = [
      "nm-bridge"
      "virbr0"
    ];
    enable = true;
    qemu.runAsRoot = false;
  };
  boot.extraModulePackages = with config.boot.kernelPackages; [ virtualbox ];
}
=======
{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ virt-manager virtualbox distrobox ];
  virtualisation.libvirtd = {
    allowedBridges = [
      "nm-bridge"
      "virbr0"
    ];
    enable = true;
    qemuRunAsRoot = false;
  };
  boot.extraModulePackages = with config.boot.kernelPackages; [ virtualbox ];
}
>>>>>>> Stashed changes
