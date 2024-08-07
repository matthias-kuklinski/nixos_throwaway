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
    "direnv"
    "eza"
    "firefox"
    "fuzzel"
    "foot"
    "gh"
    "git"
    "gpg"
    "fonts"
    "hyprland"
    "jq"
    "mpv"
    "neovim"
    # "obs-studio"
    "rg"
    "starship"
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
      act
      azure-cli
      go
      grim
      imagemagick
      keepassxc
      logseq
      lua
      mpvpaper
      nodejs_21
      ollama
      obsidian
      pinentry
      slurp
      terraform
      tfswitch
      ueberzugpp
      qpdf
      wl-clipboard
      wf-recorder
      unzip
    ];

    sessionPath = [ "$HOME/.local/bin" ];
    file = {
      "zwift.sh" = {
        source = pkgs.fetchurl {
          url = "https://raw.githubusercontent.com/netbrain/zwift/master/zwift.sh";
          hash = "sha256-joipzHtLvy+l4H+NOLTSpVf8bzVGUF4JVDcyfQIt5II=";
        };
        target = ".local/bin/zwift";
        executable = true;
      };
    };
  };
}
