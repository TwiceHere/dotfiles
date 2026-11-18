{
  description = "A very basic flake";
  nixConfig = {
    extra-substituters = [ "https://helix.cachix.org" ];
    extra-trusted-public-keys = [ "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs=" ]; 

  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";

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
    helix.url = "github:helix-editor/helix/master";
    # helium-flake.url = "github:oxcl/nix-flake-helium-browser";
    # helium-flake.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    silentSDDM,
    lazyvim,
    zen-browser,
    helix,
    # nixpkgs-stable,
    # helium-flake,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    # pkgs-stable = import nixpkgs-stable {
    #   inherit system;
    #   config.allowUnfree = true;
    # };
  in {
    homeConfigurations.knull = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {
        inherit silentSDDM;
        inherit zen-browser;
        inherit helix;
        # inherit pkgs-stable;
        # inherit helium-flake;
      };
      modules = [
        ./home.nix
        # lazyvim.homeManagerModules.default
        # ./modules/lazyvim.nix
        ./modules/cursor.nix
        ./modules/starship.nix
        ./modules/dotlinks.nix
        ./modules/shells.nix
        # ./modules/ghostty.nix
        ./modules/zen-browser.nix
        ./modules/programs.nix
        # ./modules/tmux.nix
        ./modules/development.nix
        ./modules/nushell.nix
        # ./modules/helium.nix
        ./modules/misc.nix
	./modules/helix.nix
        # ./modules/stable_packages.nix

        #./modules/silentddm.nix
        # ./modules/fonts.nix
      ];
    };
  };
}
