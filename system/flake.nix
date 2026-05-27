{
  description = "A very basic flake";

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nixpkgs, silentSDDM, noctalia, ... }: {
      nixosConfigurations.knull = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; 
        specialArgs = { inherit inputs silentSDDM; }; 
        modules = [
          ./configuration.nix
          ./modules/packages.nix
          ./modules/fonts.nix
          ./modules/sddm.nix
          ./modules/noctalia.nix
          ./modules/driver.nix
          ./modules/extra.nix
        ]; 
      }; 


  };
}
