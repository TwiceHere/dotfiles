{ silentSDDM, lib, ... }: 

{
  imports = [silentSDDM.nixosModules.default]; 
  services.displayManager.sddm.wayland.enable = lib.mkForce true;
  programs.silentSDDM = {
    enable = true; 
    theme = "rei"; 
  }; 

}
