{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  # https://nixos.wiki/wiki/Fonts#Installing_specific_fonts_from_nerdfonts
  home.packages = [
    (pkgs.nerdfonts.override { 
      fonts = [ "Hack" ]; 
    })
  ];
}
