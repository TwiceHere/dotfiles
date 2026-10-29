{config, pkgs, hyprland, ...}: 

{
  programs.hyprland = {
  enable = true; 
  package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  portalPackage = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
}
