{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.hm.direnv-instant;
in
{
  options.hm.direnv-instant = {
    enable = lib.mkEnableOption "enable direnv-instant";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      inputs.direnv-instant.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
