{ config, pkgs, ... }: 

{
  programs.starship = {
    enable = true; 
    enableZshIntegration = true; 
    enableBashIntegration = true; 

    settings = {
      add_newline = false; 
    };
  }; 
}
