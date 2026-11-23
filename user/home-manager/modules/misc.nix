{pkgs, ...}: {
  home.packages = with pkgs; [
    # gnome-pomodoro
    libnotify
    cava
    wl-clipboard
    blanket
    foot
    cbonsai
    # mdcat
    pipx
    watchexec
    tree-sitter
    ffmpeg
    pulseaudio
    ungoogled-chromium
  ];
}
