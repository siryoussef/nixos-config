<<<<<<< Updated upstream
{ config, pkgs, userSettings, ... }:

{
  home.packages = [ pkgs.git ];
  programs.git.enable = true;
  programs.git.userName = userSettings.name;
  programs.git.userEmail = userSettings.email;
  programs.git.extraConfig = {
    init.defaultBranch = "main";
    safe.directory = "/home/" + userSettings.username + "/.dotfiles";
  };
}
=======
{ config, lib, pkgs, name, email, ... }:

{
  home.packages = [ pkgs.git ];
  programs.git.enable = true;
  programs.git.userName = name;
  programs.git.userEmail = email;
  programs.git.extraConfig = {
    init.defaultBranch = "main";
  };
}
>>>>>>> Stashed changes
