{ lib, pkgs, ... }:

let
  modulesDirectory = ../modules/home-manager;
  username = "matthias";
in
{
  imports = lib.concatMap(
    path: [ "${modulesDirectory}/${path}.nix" ]
  ) [
    "bottom"
    "eza"
    "firefox"
    "foot"
    "git"
    "gpg"
    "fonts"
    "hyprland"
    "neovim"
    "rg"
    "starship"
    "ssh"
    "tealdeer"
    "xdg"
    "zoxide"
    "zsh"
  ];

  programs.home-manager.enable = true;

  home = { 
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";

    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
    };

    packages = with pkgs; [
      keepassxc
      qpdf
    ];
  };
}
