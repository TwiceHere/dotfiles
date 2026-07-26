{
  config,
  pkgs,
  ...
}: let
  rtl8192eu-clnhub = config.boot.kernelPackages.callPackage ({
    stdenv,
    fetchFromGitHub,
    kernel,
    lib,
  }:
    stdenv.mkDerivation {
      pname = "rtl8192eu-clnhub";
      version = "5.11.2.3";

      src = fetchFromGitHub {
        owner = "clnhub";
        repo = "rtl8192eu-linux";
        rev = "5.11.2.3";
        hash = "sha256-CTMymsHdcCHSWeviXwRoLmxJx564/+yLc7T1a7NiAF8=";
      };

      nativeBuildInputs = kernel.moduleBuildDependencies;

      makeFlags = [
        "KSRC=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
      ];

      installPhase = ''
        runHook preInstall

        mkdir -p $out/lib/modules/${kernel.modDirVersion}/kernel/drivers/net/wireless
        cp 8192eu.ko \
          $out/lib/modules/${kernel.modDirVersion}/kernel/drivers/net/wireless/

        runHook postInstall
      '';
    }) {};
in {
  boot.blacklistedKernelModules = ["rtl8xxxu"];

  boot.extraModulePackages = [rtl8192eu-clnhub];
}
