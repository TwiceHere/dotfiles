{
  config,
  pkgs,
  ...
}: {
  programs.zsh.enable = true;
  programs.bash.enable = true;

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fish = {
    enable = true;
    shellInit = ''
      fish_add_path ~/.local/bin
      set -gx EDITOR hx
      set -gx VISUAL hx
    '';
    shellAliases = {
      ll = "eza -la";
      cat = "bat";
      ls = "eza";

      tp = "z (fd -t d . ~ | fzf)";
      cdf = "z (fd -t d . | fzf)";
      ruf = "run (fd --exact-depth 1 -e py -e c -e go -e sh -e cpp -e sql -e rs | fzf)";
      nd = "nix develop -c fish";
    };
    interactiveShellInit = ''
      set -g fish_greeting
    '';
  };
}
