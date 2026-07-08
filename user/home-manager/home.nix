{pkgs, ...}: {
  home.username = "sonu";
  home.homeDirectory = "/home/sonu";

  home.packages = with pkgs; [
    tmux
    curl
    ripgrep
    fd
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
    unzip
    eza
    bat
    fastfetch

    devenv
    cava
    wl-clipboard
    blanket
    cbonsai

    grim
    slurp
    jq
    tree

    helix
    zellij
  ];

  xdg.desktopEntries.anki = {
    name = "Anki";
    exec = "anki";
    noDisplay = true;
  };

  home.stateVersion = "25.11";
}
