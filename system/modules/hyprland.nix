{
  pkgs,
  hyprland,
  ...
}: {
  programs.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    # package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # portalPackage = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
}
