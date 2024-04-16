{ pkgs, ... }: {
  home.packages = [ pkgs.swaynotificationcenter ];

  imports = [
    ./config.nix
    ./configSchema.nix
    ./style.nix
  ];
}
