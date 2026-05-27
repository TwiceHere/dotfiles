{ config, pkgs, ... }: 

{
  home.file.".config/kitty".source = 
    config.lib.file.mkOutOfStoreSymlink 
    "/home/sonu/dotfiles/kitty"; 
}
