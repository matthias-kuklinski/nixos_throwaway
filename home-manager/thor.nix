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
    "zoxide"
  ];

  programs.home-manager.enable = true;

  home = { 
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
  };
}
