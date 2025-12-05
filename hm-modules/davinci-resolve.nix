{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.davinci-resolve;
in
{
  options.hm.davinci-resolve = {
    enable = lib.mkEnableOption "enable davinci-resolve";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.davinci-resolve
    ];
  };
}
