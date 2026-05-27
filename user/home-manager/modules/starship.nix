{ config, pkgs, ... }: 

{
  programs.starship = {
    enable = true; 
    enableZshIntegration = true; 
    enableBashIntegration = true; 
    enableFishIntegration = true; 
    settings = 
      builtins.fromTOML
      (builtins.readFile ../../../starship/starship.toml); 

    # settings = {
    #   add_newline = false; 
    # };
  }; 
}
