{ lib, pkgs, ... }:

let
  modulesDirectory = ../modules/home-manager;
  username = "matthias";
in
{
  imports = lib.concatMap(
    path: [ "${modulesDirectory}/${path}.nix" ]
  ) [
    "eza"
    "firefox"
    "foot"
    "fonts"
    "hyprland"
    "neovim"
    "rg"
    "starship"
    "tealdeer"
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
      qpdf
    ];
  };
}
