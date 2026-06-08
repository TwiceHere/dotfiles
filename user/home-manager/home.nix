{pkgs, ...}: {
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
  programs.uv = {
    enable = true;
  };
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
  ];

  xdg.desktopEntries.anki = {
    name = "Anki";
    exec = "anki";
    noDisplay = true;
  };

  programs.neovim.enable = true;

  home.stateVersion = "25.11";
}
