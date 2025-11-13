{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.opts.window-managers.mango;
in
{

  imports = [
    inputs.mango.nixosModules.mango
  ];

  options.opts.window-managers.mango = {
    enable = lib.mkEnableOption "enable mango";
  };

  config = lib.mkIf cfg.enable {
    programs.mango.enable = true;
  };
}
