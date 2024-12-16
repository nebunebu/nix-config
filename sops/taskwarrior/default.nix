{ lib
, config
, pkgs
, ...
}:
let
  cfg = config.neb.terminal.productivity.taskwarrior;
in
{
  options = {
    neb.terminal.productivity.taskwarrior = {
      enable = lib.mkEnableOption "enable taskwarrior";
      recurrence.disable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Disable recurrence for non-primary syn clients";
      };
    };
  };
  config = lib.mkIf cfg.enable {
    home-manager.users.nebu = {
      sops = {
        secrets = {
          taskwarrior_client_id = { };
          taskwarrior_encryption_secret = { };
        };
        templates = {
          "taskrc" = {
            owner = "nebu";
            path = "/home/nebu/.taskrc";
            content = /* ini */ ''
              taskd.client.id=${config.sops.placeholder.taskwarrior_client_id}
              encryption.secret=${config.sops.placeholder.taskwarrior_encryption_secret}
            '';
          };
        };

        programs = {
          taskwarrior = {
            enable = true;
            package = pkgs.taskwarrior3;
            config = {
              color = "on";
              rule.precedence.color = "deleted,completed,active,keyword.,tag.,project.,overdue,scheduled,due.today,due,blocked,blocking,recurring,tagged,uda.";
              "recurrence" = if cfg.recurrence.disable then "off" else "on";
            };

            extraConfig = /* ini */ ''
              # Hidden tag context configuration
              context.hide.read=-hidden
              context.hide.write=none
      
              # Make the hide context the default
              context=hide
            '';
          };
        };
      };
    };
  };
}
