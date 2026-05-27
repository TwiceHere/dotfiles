{ silentSDDM, ...}: 

{
  imports = [
    silentSDDM.nixosModules.default
  ]; 
  programs.silentSDDM = {
    enable = true; 
    theme = "rei";
  }; 

}
