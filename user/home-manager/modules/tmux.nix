{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    historyLimit = 5000;
    mouse = true;
    prefix = "C-Space";
    shell = "/home/sonu/.nix-profile/bin/fish";

    plugins = with pkgs.tmuxPlugins; [
      yank
      sensible
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "mocha"
          set -g @catppuccin_window_status_style "rounded"
          set -g @catppuccin_transparent_background "true"
          set -g @catppuccin_window_default_fill "none"
          set -g @catppuccin_window_active_fill "none"
          set -g @catppuccin_window_text " #I"
          set -g @catppuccin_window_current_text " #W"
        '';
      }
      cpu
      battery
    ];

    extraConfig = ''
      #Use vi keys in copy mode
      setw -g mode-keys vi
      bind-key -T copy-mode-vi v send-keys -X begin-selection

      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle


      set -ga terminal-overrides ",tmux-256color:Tc,xterm-kitty:Tc,kitty:Tc"
      set -ga terminal-features ",kitty:RGB"

      set -g allow-passthrough on

      set -g window-style 'bg=default'
      set -g window-active-style 'bg=default'
      set -g pane-border-style bg=default
      set -g pane-active-border-style bg=default
      set -g status-style bg=default
      set -g popup-style "bg=default,fg=default"

      bind -n C-M-h select-pane -L
      bind -n C-M-j select-pane -D
      bind -n C-M-k select-pane -U
      bind -n C-M-l select-pane -R

      # bind r source-file ~/.tmux.conf \; display-message "Tmux config reloaded!"
      bind r refresh-client

      bind Enter display-popup -d "#{pane_current_path}" -E -w 90% -h 90%

      set -g window-status-format ""
      set -g window-status-current-format ""
      set -g automatic-rename off
      set -g status-left "#[fg=#11111b,bg=#{@thm_mauve}]#[fg=#181825,reverse]#[none]#I #[fg=#cdd6f4,bg=#{@thm_surface_1}] #W#[fg=#181825,reverse]#[none]"
      set -g status-left-length 50
      set -g status-right-length 100
      set -g status-right "#{E:@catppuccin_status_application}#{E:@catppuccin_status_session}"

      run-shell "tmux set -g status-style bg=default"
    '';
  };
}
