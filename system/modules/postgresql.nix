{
  lib,
  config,
  pkgs,
  ...
}: {
  config.services.postgresql = {
    enable = true;
    ensureDatabases = ["mydatabase"];
    authentication = pkgs.lib.mkOverride 10 ''
      #type databse DBuser auth-method
      local  all    all    trust
    '';
  };
}
