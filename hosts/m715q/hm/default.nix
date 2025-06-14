{
  self,
  pkgs,
  ...
}:

{
  imports = [ "${self}/hm-modules" ];

  home.packages = [
  ];

  neb = {
    services.syncthing.enable = true;
    profile = {
      # development.enable = true;
      terminal.enable = true;
    };
  };
}
