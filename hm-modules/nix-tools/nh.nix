{
  lib,
  config,
  ...
}:
let
  cfg = config.neb.terminal.utilities.nh;
in
{
  options.neb.terminal.utilities.nh = {
    enable = lib.mkEnableOption "enable nh";
  };

  config = lib.mkIf cfg.enable {
    home.sessionVariables = {
      NH_FLAKE = lib.mkDefault "${config.home.homeDirectory}/.nix-config";
    };
    programs = {
      nh = {
        enable = true;
      };
    };
  };
}
