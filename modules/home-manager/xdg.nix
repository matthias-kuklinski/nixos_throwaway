{ config, pkgs, ... }:
let
  homeDirectory = config.home.homeDirectory;
in 
{
  home.packages = with pkgs; [
    # additional xdg-desktop-portal's are not needed and in fact won't allow smooth screen sharing
    xdg-desktop-portal-gtk      # required for file picker etc.
    xdg-desktop-portal-hyprland # https://wiki.hyprland.org/Useful-Utilities/xdg-desktop-portal-hyprland/
  ];

  xdg = {
    enable = true;

    cacheHome = "${config.home.homeDirectory}/.cache";
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";
    
    userDirs = {
      enable = true;

      createDirectories = true;
      desktop = "${config.home.homeDirectory}/desktop";
      documents = "${config.home.homeDirectory}/documents";
      download = "${config.home.homeDirectory}/downloads";
      extraConfig = {
        XDG_ENGINEERING_DIR = "${config.home.homeDirectory}/engineering";
        XDG_VAULT_DIR = "${config.home.homeDirectory}/vault";
        XDG_NOTES_DIR = "${config.home.homeDirectory}/notes";
      };
      music = "${config.home.homeDirectory}/music";
      pictures = "${config.home.homeDirectory}/pictures";
      publicShare = "${config.home.homeDirectory}/public";
      templates = "${config.home.homeDirectory}/templates";
      videos = "${config.home.homeDirectory}/videos";
    };

    mime.enable = true;
    mimeApps = {
      enable = true;

      defaultApplications = {
        "video/mp4" = [ pkgs.mpv ];
        "application/pdf" = [ pkgs.zathura ];
      };
    };
  };
}
