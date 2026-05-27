{ config, pkgs, ... }: 

{
  programs.zsh.enable = true; 
  programs.bash.enable = true; 

  programs.fzf = {
    enable = true; 
    enableFishIntegration = true; 
  };

  programs.zoxide = {
    enable = true; 
    enableFishIntegration = true; 
  };

  programs.fish.enable = true; 

}
