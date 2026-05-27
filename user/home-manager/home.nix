{ pkgs, ...}: 


{
  home.username = "sonu"; 
  home.homeDirectory = "/home/sonu"; 

  programs.zsh.enable = true; 
  programs.bash.enable = true; 

  programs.git = {
    enable = true; 
    settings = {
      user = {
        name = "TwiceHere"; 
        email = "temporaryt618@gmail.com"; 
      }; 
    }; 
  }; 
  imports = [
    ./modules/dotlinks.nix
  ]; 

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
    fzf
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
  ]; 
  programs.neovim.enable = true; 


  home.stateVersion = "25.11"; 
}
