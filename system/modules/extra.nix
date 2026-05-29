{ lib, config, pkgs, ...}: 

{
  networking.firewall.allowedTCPPorts = [ 53317 ];
  networking.firewall.allowedUDPPorts = [ 53317 ];

  i18n.defaultLocale = lib.mkForce "en_US.UTF-8";
  i18n.supportedLocales = [ "all" ]; 

  # programs.nix-ld = {
  #   enable = true; 
  #   libraries = with pkgs; [
  #     gcc.cc.lib
  #     zlib 
  #     openssl
  #   ]; 
  # }; 
}
