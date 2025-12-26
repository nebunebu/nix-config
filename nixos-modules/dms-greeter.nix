{
  inputs,
  config,
  lib,
  ...
}:
let
  cfg = config.nos.dms-greeter;
in
{
  imports = [ inputs.dankMaterialShell.nixosModules.greeter ];

  options.nos.dms-greeter = {
    enable = lib.mkEnableOption "enable dms-greeter configuration";
  };

  config = lib.mkIf cfg.enable {
    services.displayManager.dms-greeter = {
      enable = true;
      compositor = {
        name = "hyprland";
      };
    };
  };
}
