{
  pkgs,
  zen-browser,
  config,
  ...
}: {
  # 1. Install ONLY the raw binary package
  home.packages = [
    zen-browser.packages.${pkgs.system}.default
  ];

  # 2. Tell Home Manager to symlink your live dotfiles folder to your config folder
  # This ensures any changes you make in the GUI instantly update your git repo!
  home.file.".config/zen".source = config.lib.file.mkOutOfStoreSymlink "/home/sonu/dotfiles/zen";
}
