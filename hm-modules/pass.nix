{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.hm.pass;
in
{
  options.hm.pass = {
    enable = lib.mkEnableOption "enable password-store";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.dmenu-wayland
      pkgs.passff-host
      pkgs.passExtensions.pass-import
      pkgs.passExtensions.pass-genphrase
      # pkgs.passExtensions.pass-update
      # pkgs.passExtensions.pass-tomb
      # pkgs.passExtensions.pass-otp
      # pkgs.passExtensions.pass-file
      # pkgs.passExtensions.pass-checkup
      # pkgs.passExtensions.pass-audit
    ];

    programs.password-store = {
      enable = true;
      settings = {
        PASSWORD_STORE_DIR = "${config.home.homeDirectory}/.password-store";
        # PASSWORD_STORE_KEY =  "neb";
      };
    };
  };
}
