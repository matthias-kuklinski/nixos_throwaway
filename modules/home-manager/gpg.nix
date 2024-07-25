{ config, pkgs, ... }:

{
  programs.gpg = {
    enable = true;
    homedir = "${config.home.homeDirectory}/.gnupg";
  };

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-tty;
    # https://superuser.com/a/624488
    defaultCacheTtl = 86400;
    maxCacheTtl = 86400;
  };
}
