{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome-pomodoro
    cava
    wl-clipboard
    blanket
    cbonsai
    mdcat
    pipx
    leaf-markdown-viewer
    watchexec
  ];
}
