{
  lib,
  config,
  pkgs,
  ...
}: {
  networking.firewall.allowedTCPPorts = [53317];
  networking.firewall.allowedUDPPorts = [53317];

  i18n.defaultLocale = lib.mkForce "en_US.UTF-8";
  i18n.supportedLocales = ["all"];

  nix.settings.trusted-users = ["root" "sonu"];

  services.keyd = {
    enable = true;

    keyboards.default = {
      ids = ["*"];
      settings = {
        main = {
          capslock = "overload(control, esc)";
          tab = "overload(meta, tab)";
          rightalt = "capslock";
        };
      };
    };
  };
  security.polkit.enable = true;

  # services.kanata = {
  #   enable = true;
  #
  #   keyboards.default = {
  #     config = ''
  #       (defsrc
  #       caps
  #       )
  #
  #       (defalias
  #         escctrl (tap-hold 50 100 esc lctrl)
  #       )
  #
  #       (deflayer base
  #         @escctrl
  #       )
  #     '';
  #   };
  # };

  # programs.nix-ld = {
  #   enable = true;
  #   libraries = with pkgs; [
  #     gcc.cc.lib
  #     zlib
  #     openssl
  #   ];
  # };
}
