{
  pkgs,
  zen-browser,
  ...
}: {
  imports = [
    zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    profiles.default.mods = [
      "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
      "642854b5-88b4-4c40-b256-e035532109df" # Transparent Zen
    ];
  };
}
