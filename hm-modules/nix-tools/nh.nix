{
  lib,
  config,
  ...
}:
let
  cfg = config.opts.nix-tools.nh;
in
{
  options.opts.nix-tools.nh = {
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
