{pkgs, ...}: {
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
    # hyprpolkitagent
    scrcpy
    v4l-utils
  ];
  programs.kdeconnect = {
    enable = true;
  };
}
