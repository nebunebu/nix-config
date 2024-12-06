{ lib
, config
, ...
}:
let
  cfg = config.neb.security.gpg;

  hostKeys = {
    t5610 = "1368211EA56597F3FEC239E1EF49AA93A1D5B168";
    x230t = "B5BA1CD101FE0178F1067A10483003E1477212AE";
  };
in
{
  options.neb.security.gpg = {
    enable = lib.mkEnableOption "enable gpg";

    host = lib.mkOption {
      type = lib.types.enum (builtins.attrNames hostKeys);
      description = "The host identifier for GPG key selection";
      example = "t5610";
    };


    key = lib.mkOption {
      type = lib.types.str;
      description = "The GPG key for the current host";
      default = hostKeys.${cfg.host};
    };
  };

  config = lib.mkIf cfg.enable {
    programs.gpg = {
      enable = true;

      settings = {
        default-key = hostKeys.${cfg.host};
      };
    };
    systemd.user.services.gpg-agent = {
      Unit = {
        Description = "GnuPG private key agent";
        IgnoreOnIsolate = true;
      };

      Service = {
        Type = "forking";
        ExecStart = "${config.programs.gpg.package}/bin/gpg-agent --daemon";
        Restart = "on-failure";
        RestartSec = "5s";
      };

      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}
