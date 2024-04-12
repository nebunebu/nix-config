{ pkgs, ... }: {
  home.packages = with pkgs; [
    swaynotificationcenter
  ];

  imports = [
    ./config.nix
    ./configSchema.nix
    ./style.nix
  ];
}
