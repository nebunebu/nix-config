{ lib
, config
, ...
}:
let
  cfg = config.neb.terminal.media.newsboat;
in
{
  imports = [
    ./scripts/linkhandler.nix
  ];

  options = {
    neb.terminal.media.newsboat.enable = lib.mkEnableOption "enable newsboat";
  };

  config = lib.mkIf cfg.enable {
    programs.newsboat = {
      enable = true;
      browser = "linkhandler";
      extraConfig = ''
        urls-source "freshrss"
        freshrss-url "http://192.168.1.177/api/greader.php"
        freshrss-login "admin"
        freshrss-flag-star "s"
        freshrss-passwordeval "pass show freshrss/nebu"
      ''
      + builtins.readFile ./confs/keybinds.conf
      + builtins.readFile ./confs/colors.conf
        # + builtins.readFile ./confs/browser.conf
      ;
    };
  };
}
