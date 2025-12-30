{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.hm.taskwarrior;
in
{
  options = {
    hm.taskwarrior = {
      enable = lib.mkEnableOption "enable taskwarrior";
      recurrence.disable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Disable recurrence for non-primary syn clients";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs = {
      taskwarrior = {
        enable = true;
        package = pkgs.taskwarrior3;
        config = {
          color = "on";
          rule.precedence.color = "deleted,completed,active,keyword.,tag.,project.,overdue,scheduled,due.today,due,blocked,blocking,recurring,tagged,uda.";
          "recurrence" = if cfg.recurrence.disable then "off" else "on";
        };

        extraConfig =
          # ini
          ''
            news.version=3.1.0
          '';
      };
    };
  };
}
