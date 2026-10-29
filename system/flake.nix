{
  description = "A very basic flake";

  nixConfig = {
    extra-substituters = [
        "https://noctalia.cachix.org"
        "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
    "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-stable,
    silentSDDM,
    noctalia,
    hyprland,
    ...
  }: {
    nixosConfigurations.knull = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs silentSDDM nixpkgs-stable hyprland;};
      modules = [
        ./configuration.nix
        ./modules/packages.nix
        ./modules/fonts.nix
        ./modules/sddm.nix
        ./modules/noctalia.nix
        ./modules/driver.nix
        ./modules/extra.nix
        ./modules/postgresql.nix
        ./modules/hyprland.nix
      ];
    };
  };
}
