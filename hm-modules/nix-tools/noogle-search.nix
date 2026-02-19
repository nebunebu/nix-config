{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.hm.nix-tools.noogle-search;
in
{
  options.hm.nix-tools.noogle-search = {
    enable = lib.mkEnableOption "enable noogle-search";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      inputs.noogle-search.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
