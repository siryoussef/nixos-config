<<<<<<< Updated upstream
{ pkgs, ... }:

{
  # Collection of useful CLI apps
  home.packages = with pkgs; [
    # Command Line
    disfetch lolcat cowsay
    starfetch
    cava
    killall
    libnotify
    timer
    brightnessctl
    gnugrep
    bat eza fd bottom ripgrep
    rsync
    unzip
    tmux
    w3m
    pandoc
    hwinfo
    pciutils
    numbat
    (pkgs.callPackage ../pkgs/smartcalc.nix { })
    #(pkgs.writeShellScriptBin "sc" ''smartcalc'')
    #(pkgs.callPackage ../pkgs/pokemon-colorscripts.nix { })
    #(pkgs.python3Packages.callPackage ../pkgs/impressive.nix { })
    (pkgs.writeShellScriptBin "airplane-mode" ''
      #!/bin/sh
      connectivity="$(nmcli n connectivity)"
      if [ "$connectivity" == "full" ]
      then
          nmcli n off
      else
          nmcli n on
      fi
    '')
    vim neovim
  ];

  imports = [
    ../bin/phoenix.nix # My nix command wrapper
  ];
}
=======
{ config, lib, pkgs, ... }:

{
  # Collection of useful CLI apps
  home.packages = with pkgs; [
    # Command Line
    disfetch neofetch lolcat cowsay onefetch starfetch
    cava
    gnugrep gnused
    killall
    libnotify
    bat eza fd bottom ripgrep
    rsync
    tmux
    htop
    hwinfo
    unzip
    octave
    brightnessctl
    w3m
    fzf
    pandoc
    pciutils
    #(pkgs.callPackage ../pkgs/ytsub.nix { })
    #(pkgs.callPackage ../pkgs/russ.nix { })
    #(pkgs.python3Packages.callPackage ../pkgs/impressive.nix { })
    (pkgs.callPackage ../pkgs/pokemon-colorscripts.nix { })
    (pkgs.writeShellScriptBin "airplane-mode" ''
      #!/bin/sh
      connectivity="$(nmcli n connectivity)"
      if [ "$connectivity" == "full" ]
      then
          nmcli n off
      else
          nmcli n on
      fi
    '')
    vim neovim
  ];

  imports = [
    ../bin/phoenix.nix # My nix command wrapper
    ../bin/ytsub-wrappers.nix # My ytsub wrapper
  ];
}
>>>>>>> Stashed changes
