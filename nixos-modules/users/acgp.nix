{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.nos.users.acgp;
in
{

  options.nos.users.acgp = {
    enable = lib.mkEnableOption "enable acgp user";
  };

  config = lib.mkIf cfg.enable {
    users = {
      mutableUsers = false;
      users.acgp = {
        name = "acgp";
        isNormalUser = true;
        shell = pkgs.zsh;
        extraGroups = [
          "wheel"
          "video"
          "networkmanager"
          "pipewire"
          "render"
        ];
        hashedPassword = "$y$j9T$BrkDt/ClWWO.T/9z5EHYM0$uzInWXBqPfgUZgdM0JWQuHV7aIT.857sysLoz872Hl3";
      };
    };
  };
}
