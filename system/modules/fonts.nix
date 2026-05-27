{ pkgs, ...}: 

{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts 
    noto-fonts-cjk-sans 
    noto-fonts-cjk-serif
    nerd-fonts.jetbrains-mono
    # Fira family 
    # fira-sans
    # fira-code 
    #
    # # Bebas Neue (via google fonts) 
    # google-fonts 
    #
    # # Nerd Fonts (icons for Neovim & tiling) 
    # nerd-fonts.fira-code 
    # nerd-fonts.jetbrains-mono 
    # nerd-fonts.symbols-only 
    # #Icons 
    # font-awesome 
    # material-icons 
    # material-design-icons
  ]; 

  fonts.fontconfig.enable = true; 
} 
