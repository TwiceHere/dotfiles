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
      command = "${pkgs.fish}/bin/fish";
      theme = "Kanagawa Wave";
      font-family = "JetBrainsMono Nerd Font";
      font-size = 13;
      background-opacity = 0.90;
      background-blur = true;
    };
  };
}
