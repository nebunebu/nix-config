{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.nix-tools.nix-index;
in
{
  options.hm.nix-tools.nix-index = {
    enable = lib.mkEnableOption "enable nix-index";
  };

  config = lib.mkIf cfg.enable {

    programs = {
      nix-index = {
        enable = true;
        enableZshIntegration = true;
      };
    };
    home.packages = [
      pkgs.comma
    ];
  };
}
