{ lib, pkgs, ... }:

let
  modulesDirectory = ../modules/home-manager;
  username = "matthias";
in
{
  imports = lib.concatMap(
    path: [ "${modulesDirectory}/${path}.nix" ]
  ) [
    "aws"
    "bottom"
    "eza"
    "firefox"
    "foot"
    "git"
    "gpg"
    "fonts"
    "hyprland"
    "mpv"
    "neovim"
    "obs-studio"
    "rg"
    "starship"
    # "ssh"
    "tealdeer"
    "xdg"
    "zoxide"
    "zsh"
  ];

  programs.home-manager.enable = true;

  services = {
    ssh-agent.enable = true;
  };

  home = { 
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";

    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      # SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent";
    };

    packages = with pkgs; [
      keepassxc
      pinentry
      terraform
      qpdf
      wl-clipboard
      wf-recorder
    ];

    sessionPath = [ "$HOME/.local/bin" ];
    file = {
      "zwift.sh" = {
        source = pkgs.fetchurl {
          url = "https://raw.githubusercontent.com/netbrain/zwift/master/zwift.sh";
          hash = "sha256-RQJ6gPHXiY8CNeGGgQDnwG3mHzmMo3Yl6Ninnx+mJNY=";
        };
        target = ".local/bin/zwift";
        executable = true;
      };
    };
  };
}
