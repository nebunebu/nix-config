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

    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
      # pinentryFlavor = "gnome3"; # Or use "qt" if you prefer
      defaultCacheTtl = 1800; # 30 minutes
      maxCacheTtl = 7200; # 2 hours
    };
  };
}
