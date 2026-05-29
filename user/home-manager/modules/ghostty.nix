{ config, pkgs, ...}: 

{
  programs.ghostty = {
    enable = true; 
    enableFishIntegration = true; 
  }; 
}
