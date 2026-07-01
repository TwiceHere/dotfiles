{pkgs, ...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "TwiceHere";
        email = "temporaryt618@gmail.com";
      };
    };
  };

  programs.yazi = {
    enable = true;
    settings = {
      mgr = {
        ratio = [0 4 3];
      };
    };
  };

  programs.uv = {
    enable = true;
  };

  programs.neovim.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableFishIntegration = true;
  };
}
