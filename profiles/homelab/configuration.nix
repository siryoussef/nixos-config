<<<<<<< Updated upstream
{ userSettings, ... }:

{
  imports = [ ./base.nix
              ( import ../../system/security/sshd.nix {
                authorizedKeys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDaeejVJwUVrIZSo1isbu+gkQ7+8ftCgCsczy3OclkEVWHyRTqlG6yp74hr3j8ZNsOhov7c2Q6RqC8oy669hlxi/y9BsvtlI7sBr94oAKFOmkCS4RiK72ngJjBvI0vbk89wQQjmAd3r8B7ZcedpNOC8CkHu8SebKdYPRIUvAbPc3fTEt7DsJkazAepZCB8LEhUp57FAqQ/Ezlt3X/1uwNq5S0EbE9Zm+nUpEfSqR9apY2neKWLyGiCxpK3dzyNOuulCxvtVz+ie2sTk/6SxM+qWEoVVxhdwyxPihEjgC0EvtG0S5mVh5JmcjRkJOzzBHJuw+6r8yWn/AxGdIsoJ4rKNxH1XH1iLHgCraOLOUjUNlmejTcQPu6o92a79fdz2gCHT/BuIjfCW7MErAC3YSmF45TSur/kiWCBaTqYo06pgbQ3w1vKg7fievQlQzsutmg47RvJp6fb74yxuOdVg39cShQu/l8r6zqm21JAeUaaIp4P/0MrAIMOOVUhbK0QgsNElO4yn0ZKH8wGIF8xORh7ikxUIAyq8C41gjJiO2sAFJc3M8DhduQU3X0lHB7U0Qyu+8ZXn05+zdFPXJ73LKc7DCcLkppRXJsdHLSDEFdWqFnV7o08B4qZkPMT4pmvhwhY0Pf1fwavOqxuTstzw18gUGyQzl0foQi0Qrmdazsp2Qw== emmet@snowfire"];
                inherit userSettings; })
            ];
}
=======
{ config, lib, pkgs, blocklist-hosts, username, hostname, timezone, locale, ... }:

{
  imports =
    [ ../../system/hardware-configuration.nix
      ../../system/hardware/time.nix # Network time sync
      ../../system/security/doas.nix
      ../../system/security/gpg.nix
      ../../system/security/sshd.nix
      ( import ../../system/app/docker.nix {storageDriver = "btrfs"; inherit username pkgs config lib;} )
    ];

  # Fix nix path
  nix.nixPath = [ "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
                  "nixos-config=$HOME/dotfiles/system/configuration.nix"
                  "/nix/var/nix/profiles/per-user/root/channels"
                ];

  # Ensure nix flakes are enabled
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # I'm sorry Stallman-taichou
  nixpkgs.config.allowUnfree = true;

  # Kernel modules
  boot.kernelModules = [ "i2c-dev" "i2c-piix4" ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Networking
  networking.hostName = hostname; # Define your hostname.
  networking.networkmanager.enable = true; # Use networkmanager

  # Timezone and locale
  time.timeZone = timezone; # time zone
  i18n.defaultLocale = locale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = locale;
    LC_IDENTIFICATION = locale;
    LC_MEASUREMENT = locale;
    LC_MONETARY = locale;
    LC_NAME = locale;
    LC_NUMERIC = locale;
    LC_PAPER = locale;
    LC_TELEPHONE = locale;
    LC_TIME = locale;
  };

  # User account
  users.users.${username} = {
    isNormalUser = true;
    description = "Emmet";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    uid = 1000;
  };

  # System packages
  environment.systemPackages = with pkgs; [
    vim
    wget
    zsh
    git
    rclone
    rdiff-backup
    cryptsetup
    gocryptfs
    cryfs
  ];

  # I use zsh btw
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # It is ok to leave this unchanged for compatibility purposes
  system.stateVersion = "22.11";

}
>>>>>>> Stashed changes
