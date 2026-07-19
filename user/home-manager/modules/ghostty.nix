{
  config,
  pkgs,
  ...
}: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      custom-shader = [
        "shaders/cursor_tail.glsl"
      ];
      mouse-hide-while-typing = true;
      command = "${pkgs.fish}/bin/fish";
      theme = "Kanso Zen";
      font-family = "JetBrainsMono Nerd Font";
      font-size = 13;
      background-opacity = 0.90;
      background-blur = true;
      working-directory = "home";
      window-inherit-working-directory = false;
    };
  };
}
