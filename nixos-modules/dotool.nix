{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.nos.dotool;
in
{
  options.nos.dotool = {
    enable = lib.mkEnableOption "enable dotool configuration";

    users = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      example = [ "nebu" ];
      description = ''
        Users to put in the input/uinput groups and to run a dotoold user
        service for. dotool needs both to work, so a user left out here gets
        the package but no working daemon.
      '';
    };
  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages = [ pkgs.dotool ];

    users.groups = {
      input = { };
    };

    users.users = lib.genAttrs cfg.users (_: {
      extraGroups = [
        "input"
        "uinput"
      ];
    });

    # makes dotool work
    services.udev.extraRules = ''
      KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
    '';

    home-manager.users = lib.genAttrs cfg.users (_: {
      systemd.user.services.dotoold = {
        Unit = {
          Description = "dotool - uinput tool";
          Documentation = "https://git.sr.ht/~geb/dotool/tree/HEAD/doc/dotool.1.scd";
        };
        Service = {
          Environment = [
            "PATH=$PATH:${
              lib.makeBinPath [
                pkgs.coreutils
                pkgs.procps
              ]
            }"
          ];
          ExecStart = "${pkgs.dotool}/bin/dotoold";
          Restart = "always";
          RestartSec = 10;
        };
        Install = {
          WantedBy = [ "default.target" ];
        };
      };
    });
  };
}
