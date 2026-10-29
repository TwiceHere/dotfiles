{ config, pkgs, ... }: let
  rtl8192eu-clnhub = config.boot.kernelPackages.callPackage ({
    stdenv,
    fetchFromGitHub,
    kernel,
    lib,
  }:
    stdenv.mkDerivation {
      pname = "rtl8192eu-clnhub";
      version = "5.11.2.3-${kernel.version}";

      src = fetchFromGitHub {
        owner = "clnhub";
        repo = "rtl8192eu-linux";
        rev = "5.11.2.3";
        hash = "sha256-S2KZhJmsWRnM+GWEuwM/UCSTKxV/YH6nW2HSCX3Rezo=";
      };

      hardeningDisable = [ "pic" "format" ];
      nativeBuildInputs = kernel.moduleBuildDependencies;

      makeFlags = [
        "KSRC=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
        "ARCH=${stdenv.hostPlatform.linuxArch}"
        "CROSS_COMPILE=${stdenv.cc.targetPrefix}"
      ];

      installPhase = ''
        runHook preInstall
        d=$out/lib/modules/${kernel.modDirVersion}/kernel/drivers/net/wireless
        install -D -m644 8192eu.ko $d/8192eu.ko
        # aggregator does `cat <module>.ko.cer`; provide it
        touch $d/8192eu.ko.cer
        runHook postInstall
      '';

      meta.platforms = lib.platforms.linux;
    }) {};
in {
  boot.blacklistedKernelModules = [ "rtl8xxxu" ];
  boot.extraModulePackages = [ rtl8192eu-clnhub ];
}
