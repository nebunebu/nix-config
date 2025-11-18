{
  lib,
  config,
  ...
}:
let
  cfg = config.nos.sops.gpg;
in

{
  options.nos.sops.gpg = {
    enable = lib.mkEnableOption "enable gpg";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.nebu = {
      programs.gpg = {
        enable = true;
      };

      services.gpg-agent = {
        enable = true;
        enableSshSupport = true;
        # pinentryFlavor = "gnome3"; # Or use "qt" if you prefer
        defaultCacheTtl = 1800; # 30 minutes
        maxCacheTtl = 7200; # 2 hours
      };
    };
  };
}
