# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# sudo nixos-rebuild boot --flake /etc/nixos#Snowyfrank
{ config, pkgs, lib, systemSettings, userSettings,  ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./user/shell/sh.nix
      ./user/shell/cli-collection.nix
      #./sqldb.nix
      #<home-manager/nixos>
      #<nixpkgs/lib>
      #<nixpkgs> {};
      #<nixpkgs/nixos/modules/virtualisation/qemu-vm.nix>
    ];
  #import <nixpkgs> {};
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

  boot = {
  # Kernel modules
  #kernel.enable = true;
  kernelModules = [ "i2c-dev" "i2c-piix4" "cpufreq_powersave" ];
  plymouth.enable = true;
  enableContainers = true;
  hardwareScan = true;
  # Bootloader
  loader = {
  # Use systemd-boot if uefi, default to grub otherwise
  systemd-boot.enable = if (systemSettings.bootMode == "uefi") then true else false;
  efi.canTouchEfiVariables = if (systemSettings.bootMode == "uefi") then true else false;
   # Bootloader.
  generationsDir.copyKernels = true;
  timeout = 3;

  grub = {enable = if (systemSettings.bootMode == "uefi") then false else true;
          device = systemSettings.grubDevice; # does nothing if running uefi rather than bios
          efiSupport = true;
          efiInstallAsRemovable = false;
#         zfsSupport = true;
          copyKernels = true;
          default = 0;
 #        timeoutStyle = "menu";
          useOSProber = true;
          };
  };
};
  # Networking
  networking = { hostName = systemSettings.hostname; # Define your hostname.
  networkmanager.enable = true; # Use networkmanager
  enableIPv6 = true;
  useDHCP = false;
  wireless = {
    #enable = true;
    networks = { Fankoosh = {                   # SSID with no spaces or special characters
    psk = "Dodadoda11";           # (password will be written to /nix/store!)
  };
};
    fallbackToWPA2 = true;
    };
  useNetworkd = true;
  hostId = "94fde329";
  #wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # proxy.default = "http://user:password@proxy:port/";
  # proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  };

  # Timezone and locale
  time.timeZone = systemSettings.timezone; # time zone
  i18n.defaultLocale = systemSettings.locale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = systemSettings.locale;
    LC_IDENTIFICATION = systemSettings.locale;
    LC_MEASUREMENT = systemSettings.locale;
    LC_MONETARY = systemSettings.locale;
    LC_NAME = systemSettings.locale;
    LC_NUMERIC = systemSettings.locale;
    LC_PAPER = systemSettings.locale;
    LC_TELEPHONE = systemSettings.locale;
    LC_TIME = systemSettings.locale;
  };

  # User account
users = {
  defaultUserShell = pkgs.fish;
  users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" "input" "dialout" "libvirtd" "vboxusers" "aria2" ];
    packages = with pkgs; [
    zoom-us
    kotatogram-desktop
    libsForQt5.neochat
    libsForQt5.plasmatube
    whatsapp-for-linux
    vscode-fhs
    betterbird-unwrapped
    #vscodium-fhs
    github-desktop
    ];
    uid = 1000;
  };
};

  # I use zsh btw
  programs.zsh.enable = true;
  fonts.fontDir.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
  };
environment = {
  shells = with pkgs; [ fish zsh bash ];
  sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";
  plasma6.excludePackages = [ pkgs.kdePackages.elisa ];
  # List packages installed in system profile.
  systemPackages = with pkgs; [
    vim
    wget
    zsh
    git
    cryptsetup
    home-manager
 #   thorium-avx
#     fish
#     babelfish
#     bashInteractiveFHS
    appstream
    appstream-glib
    haskellPackages.nix-tree
    firejail
    /*
    nix-top
    nix-doc
    nix-init
    nix-diff
    nix-melt
    nix-index
    nix-ld
    */
    nixpkgs-lint-community
    ntfs3g
    pacman
    apt
    aptly
    libsForQt5.kdevelop-unwrapped
    libsForQt5.kdev-python # = { buildInputs = [ pkgs.qdarkstyle_3_02 ]; }; #( till errors are fixed : qdarkstyle & jedi versions not compatible/ packages not seen by spyder)
   # pkgs-r2211.spyder
   # python311Packages.spyder
   # python311Packages.spyder-kernels
   # python311Packages.pyls-spyder
   # python311Packages.qdarkstyle
    #python310Packages.spyder
    pmutils
    ## Appimage support (currently broken due to " error : execve : No such file or directory ")
    appimage-run
    appimagekit
    distrobox
    gnome.gnome-disk-utility
    gparted
    duperemove
    btrfs-assistant
    snapper-gui
    #librewolf
    floorp
    #chromium
    protonvpn-gui
    pitch-black
    plasma-hud
    libsForQt5.sddm-kcm
    libsForQt5.kcmutils
    libsForQt5.flatpak-kcm
    libsForQt5.kate
    libsForQt5.plasma-browser-integration
    libsForQt5.plasma-disks
    libsForQt5.filelight
    libsForQt5.kdenlive
    libsForQt5.neochat
    libsForQt5.appstream-qt
    vlc
    smplayer
    obs-studio
    handbrake
    krusader
    libreoffice-qt
    libsForQt5.discover
    virt-viewer
    spice spice-gtk
    spice-protocol
    win-virtio
    win-spice
    virt-manager-qt
    virter
    wsysmon
    tldr
    kcalc
    unetbootin
    ventoy-full
    woeusb-ng
    wimboot
    gnome.adwaita-icon-theme
    mysqltuner
    mysql-workbench
    pkgs.rPackages.Anaconda
   # grafana
    wget
    #gcc

   python311Packages.jupyterlab

    refind
    efibootmgr
    efitools
    efivar
    gnu-efi
    beefi

#     # support both 32- and 64-bit applications
#     wineWowPackages.stable
#     # support 32-bit only
#     wine
#     # support 64-bit only
#     (wine.override { wineBuild = "wine64"; })
#     # support 64-bit only
#     wine64
#     # wine-staging (version with experimental features)
#     wineWowPackages.staging
#     # winetricks (all versions)
#     winetricks

    # native wayland support (unstable)
    wineWowPackages.waylandFull
   # xen
   # grub2_xen
  ]; };




  # Install the zen kernel
#   boot.kernelPackages = pkgs.linuxPackages_zen;

  ## ZFS
/*
 # boot.zfs.enabled = lib.mkOverride 1000 true;
  boot.zfs.removeLinuxDRM = true;
  boot.zfs.forceImportRoot = false;
  boot.zfs.forceImportAll = false;
  boot.zfs.enableUnstable = true;
  boot.zfs.allowHibernation = true;
*/

 # boot.kernelParams = [ "mem_sleep_default=deep" "zfs.zfs_arc_max=12884901888" "boot.shell_on_fail" /* "resume=/dev/disk/by-uuid/50ee6795-a53f-f245-a3d0-cfabbfb81097" "resume_offset=933263" */ ];
  /*
  boot.initrd.kernelModules = [
 "dm-cache-default" # when using volumes set up with lvmcache
];
  boot.initrd.services.lvm.enable = true;
  boot.initrd.enable = true;
  */
#  boot.resumeDevice = "/dev/disk/by-uuid/50ee6795-a53f-f245-a3d0-cfabbfb81097";
#       fsType = "btrfs";
#       options = [ "subvol=swap" ];
#       #mountPoint = "/swap" ;
#       neededForBoot = true;
#       depends = [ ];






#   # Set your time zone.
#   time.timeZone = "Africa/Cairo";
#
#   # Select internationalisation properties.
#   i18n.defaultLocale = "en_US.UTF-8";


/*
i18n.extraLocaleSettings = {
    LANGUAGE = "ar_EG.UTF-8";
    LC_ALL = "ar_EG.UTF-8";
    LC_ADDRESS = "ar_EG.UTF-8";
    LC_IDENTIFICATION = "ar_EG.UTF-8";
    LC_MEASUREMENT = "ar_EG.UTF-8";
    LC_MONETARY = "ar_EG.UTF-8";
    LC_NAME = "ar_EG.UTF-8";
    LC_NUMERIC = "ar_EG.UTF-8";
    LC_PAPER = "ar_EG.UTF-8";
    LC_TELEPHONE = "ar_EG.UTF-8";
    LC_TIME = "ar_EG.UTF-8";
  };

*/

services = {
# Set the keyboard layout.
  xserver.xkb.layout = "us";
  emacs = { enable = true; install = true; startWithGraphical = true; defaultEditor = true; };
  upower.enable = true;
  acpid.enable = true;
  btrfs = { autoScrub = { enable = true; interval = "monthly"; fileSystems = [
"/Volume" ]; }; };
  physlock.lockOn.hibernate = true;
  libreddit.enable = true;
  onlyoffice.enable = false;
  logind.hibernateKey = "hibernate";
  autosuspend.settings = {
  enable = true;
  interval = 21;
  idle_time = 70;
};
  autosuspend.enable = true;
  blueman.enable = true;
  aria2 = { enable = true; downloadDir = "/Volume/@Storage/Downloads";
            rpcSecretFile = "/Volume/@Storage/Downloads/aria2-rpc-token.txt"; };
  gpm.enable = true;
  udisks2.enable = true;
  gvfs.enable = true;
  devmon.enable = true;

  jupyterhub = {
    enable = true;
    jupyterlabEnv = pkgs.python3.withPackages (p: with p; [
  jupyterhub
  jupyterlab
  numpy
  pandas
]); };
  jupyter = { enable = true; user = "youssef"; jupyter.group = "jupyter"; password = "'sha1:1b961dc713fb:88483270a63e57d18d43cf337e629539de1436ba'"; };

  /*
  jupyter.kernels = {
  python3 = let
    env = (pkgs.python312.withPackages (pythonPackages: with pythonPackages; [
            ipykernel
            pandas
           # scikit-learn
           # spyder
           # jedi
           # qdarkstyle
           # pyls-spyder
           # spyder-kernels
          ]));
  in {
    displayName = "Python 3 for machine learning";
    argv = [
      "${env.interpreter}"
      "-m"
      "ipykernel_launcher"
      "-f"
      "{connection_file}"
    ];
    language = "python";
    #logo32 = null;
    #logo64 = "${env.sitePackages}/ipykernel/resources/logo-64x64.png";
    extraPaths = {
      #"cool.txt" = pkgs.writeText "cool" "cool content";
    };
  };
};
  jupyter.package = pkgs.python312.pkgs.notebook;
  */

  thermald.enable = true;
  auto-cpufreq.enable = true;
  #logind.hibernateKey = "hibernate";
  lvm = { enable = true; boot.thin.enable = true; dmeventd.enable = true; };

  console.useXkbConfig = true;

  # Enable the X11 windowing system.
  xserver = {
  enable = true;

  displayManager = {
    # Enable automatic login for the user.
    autoLogin = { enable = true; user = "youssef"; };
  # Enable the GNOME Desktop Environment.
    gdm = { enable = false; wayland = true; autoSuspend = true; };

  # Enable KDE

  #autoLogin.enable = true;

    sddm = {
      enable = true;
      enableHidpi = true;
      autoLogin.relogin = true;
      wayland.enable = true ;
      settings = { Autologin = {
                   Session = "plasmawayland";
                   User = "youssef";
  }; };
      settings.Wayland.SessionDir = "${pkgs.plasma5Packages.plasma-workspace}/share/wayland-sessions";
      #autoLogin.minimumUid = 1000 ;
      };

  defaultSession = "plasmawayland";
  job.execCmd = lib.mkForce "exec /run/current-system/sw/bin/sddm";

    };
  desktopManager = {
    gnome.enable = false;
    plasma5 = {
        enable = true;
        phononBackend = "vlc";
        runUsingSystemd = true;
        useQtScaling = true;
        };
  };
  };
  spice-vdagentd.enable = true ;
  pipewire = {
    enable = true;
    alsa = { enable = true; support32Bit = true; };
    pulse.enable = true;
  };
};
programs.gnupg.agent.pinentryPackage = pkgs.pinentry-qt ;

# Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229

  # Enable CUPS to print documents.
  services.printing.enable = true;
  # Enable sound with pipewire.
  sound.enable = true;
  hardware = {
    pulseaudio.enable = false;
    cpu = { intel = { updateMicrocode = true; sgx.provision.enable = true; };
            x86.msr.enable = true; };
    bluetooth = { enable = true; powerOnBoot = true; };
  };
security = {
  rtkit.enable = true;
  #ipa.chromiumSupport = true;
  #chromiumSuidSandbox.enable = true;
  tpm2.enable = false;
  apparmor.enable = false;
  allowSimultaneousMultithreading = true;
  polkit.enable = true;
  };

/*
  ## MySQL server
  services.mysql.enable = true ;
  services.mysql.package = pkgs.mysql80;     #pkgs.mariadb;
  services.longview.mysqlUser = "youssef";
  services.longview.mysqlPassword = "123456";
*/

  /*
  users.mysql.enable = true ;
  users.mysql.user = "youssef";
  users.mysql.passwordFile = "/etc/mysql.password";
  #users.mysql.nss = import ./mysql-nss.cfg;
*/

/*
  services.mysql.replication.role = "master";
  services.mysql.replication.serverId = 1 ;
  services.mysql.replication.masterUser = "youssef";
  services.mysql.replication.masterHost = "Snowyfrank";
  services.mysql.replication.masterPassword = "123456";
  services.mysql.replication.slaveHost = "wanky";
*/

systemd = {
  /*
  services."getty@tty1".enable = false;
  services."autovt@tty1".enable = false;
  services.create-swapfile.enable = false;
  services.create-swapfile.script = ''
        ${pkgs.coreutils}/bin/truncate -s 0 /swap/swapfile
        ${pkgs.e2fsprogs}/bin/chattr +C /swap/swapfile
        ${pkgs.btrfs-progs}/bin/btrfs property set /swap/swapfile compression none
      '';
  services.create-swapfile.serviceConfig.Type = "oneshot";
  services.create-swapfile.wantedBy = [ "swap-swapfile.swap" ];
*/

/*
  services = {
#     "getty@tty1".enable = false;
#     "autovt@tty1".enable = false;

    create-swapfile = {
      enable = false;
      serviceConfig.Type = "oneshot";
      wantedBy = [ "swap-swapfile.swap" ];
      script = ''
      ${pkgs.coreutils}/bin/truncate -s 0 /swap/swapfile
      ${pkgs.e2fsprogs}/bin/chattr +C /swap/swapfile
      ${pkgs.btrfs-progs}/bin/btrfs property set /swap/swapfile compression none
    '';
    };
  };
  */

  oomd = { enable = true;
           enableRootSlice = false;
  #        enableUserSlices = false;
           enableSystemSlice = false; };


  network.wait-online.enable = false;
  enableUnifiedCgroupHierarchy = pkgs.lib.mkForce  true;
  enableCgroupAccounting = true;
};


  #nixpkgs.overlays = [ (import ./overlays.nix) ];
  /*[
  (self: super: {
    spyder = super.spyder.override {
      postPatch = ''
    sed -i /pyqtwebengine/d setup.py
    substituteInPlace setup.py \
      --replace "qdarkstyle>=3.0.2,<3.1.0" "qdarkstyle" \
      --replace "ipython>=7.31.1,<9.0.0,!=8.8.0,!=8.9.0,!=8.10.0,!=8.11.0,!=8.12.0,!=8.12.1" "ipython" \
      --replace "jedi>=0.17.2,<0.19.0" "jedi" \
      --replace "pylsp>=1.7.4,<1.8.0" "pylsp"
'';
    };
  })
];*/


/*
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

*/


 #Controversial
 # Allow unfree packages
  nixpkgs = { config = { allowUnfree = true; allowBroken = true; }; };

  services.logrotate.checkConfig = false; #logrotate is disabled due to an error during buildnixpkgs.config.allowUnfree = true;


  #linkedPackages = { "python311Packages.spyder". "python311Packages.spyder-kernels", "python311Packages.pyls-spyder", "python311Packages.qdarkstyle" }; };


  /*
   nixpkgs.config.permittedInsecurePackages = [
   "xen-4.15.1"
   "openssl-1.1.1w"
   "openssl-1.1.1u"
  ];
  */


  # Enable flatpak support
  services.flatpak.enable = true;
  # firejail
nix = {
  # Fix nix path
  nixPath = [ "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
                  "nixos-config=$HOME/dotfiles/system/configuration.nix"
                  "/nix/var/nix/profiles/per-user/root/channels"
                ];
  package = pkgs.nixFlakes;
  extraOptions = ''
    experimental-features = nix-command flakes
  '';
  checkAllErrors = true;
  checkConfig = true;
  optimise = { automatic = true; dates = [ "weekly" ]; };
  gc = { automatic = true;  dates = "weekly"; };
  #extraOptions = '' experimental-features = nix-command flakes '';
  channel.enable = true;
  settings = { auto-optimise-store = true;
               experimental-features = ["nix-command " "flakes" /*"configurable-impure-env"*/ "auto-allocate-uids"] ; };
  #registry = { };
  #registry = { "flakes"=[]  "version" 2; };
};

programs = {
  firejail.enable = true;
  captive-browser.enable = false;
  virt-manager = { enable = true; package = pkgs.virt-manager; };
  partition-manager.enable = true;
  git.enable = true;
  nix-index = { enable = true;
                enableBashIntegration = true;
                enableFishIntegration = true;
                };
  #cfs-zen-tweaks.enable = true;
  dconf.enable = true;
  fuse.userAllowOther = true;
  nano.syntaxHighlight = true;
  bash = { enableCompletion = true; enableLsColors = true; };
  #wayfire.enable = true;
  atop = { enable = true; atopgpu.enable = false; };
  system-config-printer.enable = false;
  java = { enable = true; package = pkgs.jre; binfmt = true; };

  tmux.enable = true;
  adb.enable = true;
  waybar.enable = false;
  xwayland.enable = true;
  htop.enable = true;
  darling = { enable = false; package = pkgs.darling;};
  chromium = {
    enable = true;
    enablePlasmaBrowserIntegration = true;
    plasmaBrowserIntegrationPackage = pkgs.plasma5Packages.plasma-browser-integration;
    homepageLocation = "https://duckduckgo.com";
    defaultSearchProviderEnabled = true;
  };
  command-not-found.enable = false;
  miriway.enable = false;

  direnv = { enable = true; loadInNixShell = true; nix-direnv.enable = true; };

  firefox = {
    enable = true;
    package = pkgs.floorp;
    nativeMessagingHosts = {
    packages = with pkgs; [ uget-integrator browserpass];
  # uget-integrator = true;
  # browserpass = true; ##deprecated
    };
  };
  kdeconnect = { enable = true; package = pkgs.plasma5Packages.kdeconnect-kde; };
  /*
  fish = { enable = true;
           vendor = { completions.enable = true;
                    functions.enable = true;
                    config.enable = true;
                    };
           useBabelfish = true;
        };
  */
  gnome-disks.enable = true;
  };
  appstream.enable = true;
#   qt.style = "adwaita-dark";
#   qt.platformTheme = "kde";
  qt.enable = true;
  gtk.iconCache.enable = true;

  virtulisation = {
  waydroid.enable = true;
  lxd.enable = true;
  podman.enable = true;
  oci-containers.backend = "podman";
  vmware.host = { enable = false; package = pkgs.vmware-workstation; };
  lxc.lxcfs.enable = true;
  xen = {
    enable = false;
    package = pkgs.xen;
    package-qemu = pkgs.xen;
    domain0MemorySize = 0;
    };
  virtualbox = {
      host = {
        enable = false;
        enableKvm = true;
        enableExtensionPack = true; #unfree
        addNetworkInterface = true;
        enableWebService = true;
        enableHardening = true;
        };
  #VirtualBox guest
  guest = { enable = false; guest.x11 = true; };
  };
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];

  kvmgt.enable = true;

  libvirtd = {
    enable = true;
    allowedBridges = [ "virbr0" ];
    onBoot = "start";
    parallelShutdown = 3;
    onShutdown = "suspend";
    };

  docker.enable = false;
  multipass.enable = false;
  appvm.enable = false;
  appvm.user = "youssef";
  vswitch.enable = false;

/*
fileSystems = {
"/" = {
device = "/dev/disk/by-label/Volume";
fsType = mkForce."btrfs";
options = [ "rw,subvol=ArchRoot" ];
};
};
*/

 /*
 #hypervGuest.enable = true;
  oci-containers.containers = { };
  oci-containers.backend = "podman";
  containerd.enable = true;
  kvmgt.enable = false;
  # LXD is a daemon that uses LXC (however uses only it's container creation but manages containers differently)
  lxc.enable = true;
  lxc.lxcfs.enable = true;
  lxd.enable = false; # conflicts with distrobox as it disables cgroubsv2
  lxd.agent.enable = true;
  lxd.ui.enable = true;
  lxd.recommendedSysctlSettings = true;
  lxd.zfsSupport = true;
  #learn how to make overrides
  #self: super: {lxd = super.lxd.override = { systemd.enableUnifiedCgroupHierarchy = true } };

  containers.enable = true;
  spiceUSBRedirection.enable = true;


  #Anbox
  anbox.enable = false;
  anbox.image = pkgs.anbox.image;

  #waydroid.image = "https://waydroid.dev/images/android-12-arm64.img.xz";

  xen.enable = false;

  podman.enable = true;
  podman.dockerCompat = true;

  programs.virt-manager.enable = true;
  libvirtd.enable = true;

  libvirtd.qemu = {
  swtpm.enable = true;
  ovmf.enable = true;
  ovmf.packages = [ pkgs.OVMFFull.fd ];
  };


  libvirtd.onShutdown = "suspend";
  libvirtd.parallelShutdown = 3;
  libvirtd.allowedBridges = [
  "virbr0"
];
  libvirtd.onBoot = "start";

*/
};
  powerManagement.enable = true;
#  documentation.nixos.enable = true;


/*
  zramSwap.swapDevices = 1;
  zramSwap.algorithm = "lz4";
  zramSwap.writebackDevice = "/swap/swapfile";
  swapDevices = [  { device = "/swap/swapfile"; } ];
  zramSwap.enable = false;
*/

  /*
  swapDevices = [
  {
  label = "Swap";
  }
  ];
  */

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = config.system.nixos.release; # Did you read the comment?
  system.copySystemConfiguration = true;

  }


