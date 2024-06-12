{ unstablePkgs, ... }:

{
  home.packages = [
    unstablePkgs.vesktop
    unstablePkgs.webcord
    unstablePkgs.discover-overlay
  ];
  services.arrpc.enable = true;
}
