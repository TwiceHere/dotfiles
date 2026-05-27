{ pkgs, ...}: 


{
  home.username = "sonu"; 
  home.homeDirectory = "/home/sonu"; 


  programs.git = {
    enable = true; 
    settings = {
      user = {
        name = "TwiceHere"; 
        email = "temporaryt618@gmail.com"; 
      }; 
    }; 
  }; 
  # imports = [
  #   ./modules/dotlinks.nix
  # ]; 

  home.packages = with pkgs; [
    curl 
    ripgrep 
    fd 
    tmux 
    kitty 
    alacritty 
    nitch 
    nodejs
    cmatrix 
    bat 
    bottom 
    btop 
    dysk 
    eza 
    tealdeer 
    cargo 
    localsend
    usbutils
    brave
    anki
    uv
    unzip
    eza 
    bat
  ]; 
  programs.neovim.enable = true; 


  home.stateVersion = "25.11"; 
}
