{pkgs, ...}: {
  home.username = "sonu";
  home.homeDirectory = "/home/sonu";

  home.packages = with pkgs; [
    tmux
    curl
    ripgrep
    fd
    kitty
    ghostty
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
    grim
    slurp
    jq
    tree

    ascii-image-converter
    duckdb
    glow
    blanket
    proton-vpn
    poppler-utils
    ghgrab
    fuzzel
  ];

  xdg.desktopEntries.anki = {
    name = "Anki";
    exec = "anki";
    noDisplay = true;
  };

  home.stateVersion = "25.11";
}
