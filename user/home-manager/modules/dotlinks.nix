{ config, pkgs, ... }: 

{
  home.file.".config/kitty".source = 
    config.lib.file.mkOutOfStoreSymlink 
    "/home/sonu/dotfiles/kitty"; 
  xdg.configFile."hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink 
    "/home/sonu/dotfiles/hypr"; 
    recursive = true; 
    force = true; 
  };
  xdg.configFile."noctalia" = {
    source = config.lib.file.mkOutOfStoreSymlink 
      "/home/sonu/dotfiles/noctalia"; 
    force = true; 
  }; 
}
