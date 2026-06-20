{
  config,
  pkgs,
  ...
}: {
  home.file.".config/kitty".source =
    config.lib.file.mkOutOfStoreSymlink
    "/home/sonu/dotfiles/kitty";
  xdg.configFile."hypr" = {
    source =
      config.lib.file.mkOutOfStoreSymlink
      "/home/sonu/dotfiles/hypr";
    recursive = true;
    force = true;
  };
  xdg.configFile."noctalia" = {
    source =
      config.lib.file.mkOutOfStoreSymlink
      "/home/sonu/dotfiles/noctalia";
    force = true;
  };
  home.file.".local/bin/run".source =
    config.lib.file.mkOutOfStoreSymlink
    "/home/sonu/dotfiles/myscripts/code_runner.sh";

  xdg.configFile."tmux" = {
    source =
      config.lib.file.mkOutOfStoreSymlink
      "/home/sonu/dotfiles/tmux";
    force = true;
  };
  xdg.configFile."fastfetch" = {
    source =
      config.lib.file.mkOutOfStoreSymlink
      "/home/sonu/dotfiles/fastfetch";
    force = true;
  };
}
