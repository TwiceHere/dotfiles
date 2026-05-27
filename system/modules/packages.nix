{ pkgs, ...}: 

{
  environment.systemPackages = with pkgs; [
    gcc 
    vim 
    wget
    git 
    curl 
    home-manager
    clang
    gnumake
  ]; 
}

