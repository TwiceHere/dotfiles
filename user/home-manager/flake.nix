{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lazyvim.url = "github:pfassina/lazyvim-nix";
    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    silentSDDM,
    lazyvim,
    zen-browser,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations.knull = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {
        inherit silentSDDM;
        inherit zen-browser;
      };
      modules = [
        ./home.nix
        lazyvim.homeManagerModules.default
        ./modules/lazyvim.nix
        ./modules/cursor.nix
        ./modules/starship.nix
        ./modules/dotlinks.nix
        ./modules/shells.nix
        ./modules/ghostty.nix
        ./modules/zen-browser.nix
        ./modules/programs.nix

        #./modules/silentddm.nix
        # ./modules/fonts.nix
      ];
    };
  };
}
