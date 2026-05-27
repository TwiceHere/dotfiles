{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

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

  outputs = { self, nixpkgs, home-manager, silentSDDM, lazyvim, ... }: 
  let 
    system = "x86_64-linux"; 
    pkgs = nixpkgs.legacyPackages.${system}; 
  in {
    homeConfigurations.knull = 
    home-manager.lib.homeManagerConfiguration {
      inherit pkgs; 
      extraSpecialArgs = {
        inherit silentSDDM; 
      }; 
      modules = [
        ./home.nix
        lazyvim.homeManagerModules.default
        ./modules/lazyvim.nix
        ./modules/cursor.nix
        ./modules/starship.nix

        #./modules/silentddm.nix
       # ./modules/fonts.nix
      ]; 
    }; 
  }; 
}
