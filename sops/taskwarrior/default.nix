{ lib
, pkgs
, config
, ...
}:
let
  cfg = config.neb.sops.taskwarrior;
in
{

  # imports = [ ./theme.nix ];

  options = {
    neb.sops.taskwarrior = {
      enable = lib.mkEnableOption "enable taskwarrior";
      recurrence.disable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Disable recurrence for non-primary syn clients";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    sops = {
      secrets = {
        taskwarrior_client_id = { };
        taskwarrior_encryption_secret = { };
      };
      templates = {
        "taskrc" = {
          owner = "nebu";
          path = "/home/nebu/.config/task/secrets.rc";
          content = /* ini */ ''
            uuid=${config.sops.placeholder.taskwarrior_client_id}
            encryption_secret=${config.sops.placeholder.taskwarrior_encryption_secret}

            sync.server.client_id=${config.sops.placeholder.taskwarrior_client_id}
            sync.encryption_secret=${config.sops.placeholder.taskwarrior_encryption_secret}
            sync.server.url=http://127.0.0.1:10222
          '';
        };
      };
    };


    home-manager.users.nebu = {
      programs = {
        taskwarrior = {
          enable = true;
          package = pkgs.taskwarrior3;
          config = {
            color = "on";
            rule.precedence.color =
              "deleted,completed,active,keyword.,tag.,project.,overdue,scheduled,due.today,due,blocked,blocking,recurring,tagged,uda.";
            "recurrence" = if cfg.recurrence.disable then "off" else "on";
          };

          # news.version=3.1.0
          extraConfig = /* ini */ ''
            include ~/.config/task/secrets.rc
            include ~/.config/task/rose-pine.rc

            news.version=3.1.0

            context.hide.read=-hidden
            context.hide.write=none
            context=hide
          '';
        };
      };
    };
  };
}

