{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.hm.nix-tools.nh;
in
{
  options.hm.nix-tools.nh = {
    enable = lib.mkEnableOption "enable nh";
  };

  config = lib.mkIf cfg.enable {
    programs = {
      nh = {
        enable = true;
        package = inputs.nh.packages."${pkgs.stdenv.hostPlatform.system}".default;

        flake = lib.mkDefault "${config.home.homeDirectory}/.nix-config";
      };
    };
  };
}
