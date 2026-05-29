{ config, pkgs, ...}: 

{
  programs.ghostty = {
    enable = true; 
    enableFishIntegration = true; 
    settings = {
      custom-shader = [
        "shaders/cursor_tail.glsl" 
    ];
    };
  }; 
}
