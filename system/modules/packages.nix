{ pkgs, ...}: 

{
  environment.systemPackages = with pkgs; [
    python3
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

