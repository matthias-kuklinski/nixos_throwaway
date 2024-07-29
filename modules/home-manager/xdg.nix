{ config, pkgs, ... }:
let
  homeDirectory = config.home.homeDirectory;
in 
{
  home.packages = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];

  xdg = {
    enable = true;

    cacheHome = "${homeDirectory}/.cache";
    configHome = "${homeDirectory}/.config";
    dataHome = "${homeDirectory}/.local/share";
    stateHome = "${homeDirectory}/.local/state";
    
    userDirs = {
      enable = true;

      createDirectories = true;
      desktop = "${homeDirectory}/desktop";
      documents = "${homeDirectory}/documents";
      download = "${homeDirectory}/downloads";
      extraConfig = {
        XDG_ENGINEERING_DIR = "${homeDirectory}/engineering"; # manage software engineering projects
        XDG_VAULT_DIR = "${homeDirectory}/vault";             # manage secrets
        XDG_NOTES_DIR = "${homeDirectory}/notes";             # manage notes
      };
      music = "${homeDirectory}/music";
      pictures = "${homeDirectory}/pictures";
      publicShare = "${homeDirectory}/public";
      templates = "${homeDirectory}/templates";
      videos = "${homeDirectory}/videos";
    };

    mime.enable = true;
    mimeApps = {
      enable = true;

      defaultApplications = {
        "video/mp4" = [ "mpv" ];
        "application/pdf" = [ "firefox" ];
      };
    };
  };
}
