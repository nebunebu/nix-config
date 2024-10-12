{ lib
, config
, ...
}:
let
  cfg = config.terminal.media.newsboat;
in
{
  imports = [
    ./scripts/linkhandler.nix
    # ./scripts/redbar-dl.nix
    ./urls/default.nix
  ];

  options = {
    terminal.media.newsboat.enable = lib.mkEnableOption "enable newsboat";
  };

  config = lib.mkIf cfg.enable {
    programs.newsboat = {
      enable = true;
      browser = "linkhandler";
      extraConfig =
        builtins.readFile ./confs/keybinds.conf + builtins.readFile ./confs/colors.conf
        # + builtins.readFile ./confs/browser.conf
      ;
    };
  };
}
