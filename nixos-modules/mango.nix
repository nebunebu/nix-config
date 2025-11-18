{
  inputs,
  lib,
  config,
  ...
}:
let
  cfg = config.nos.window-managers.mango;
in
{

  imports = [
    inputs.mango.nixosModules.mango
  ];

  options.nos.window-managers.mango = {
    enable = lib.mkEnableOption "enable mango";
  };

  config = lib.mkIf cfg.enable {
    programs.mango.enable = true;
  };
}
