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
  options.nos.dms-greeter = {
    enable = lib.mkEnableOption "enable dms-greeter configuration";
  };

  config = lib.mkIf cfg.enable {
    imports = [ inputs.dankMaterialShell.nixosModules.greeter ];

    programs.dankMaterialShell.greeter = {
      enable = true;
      compositor = {
        name = "hyprland";
      };
    };
  };
}
