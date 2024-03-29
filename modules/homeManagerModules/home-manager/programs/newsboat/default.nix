{ pkgs, ... }: {
  imports = [
    ./scripts/linkhandler.nix
    # ./scripts/redbar-dl.nix
    ./urls/default.nix
  ];

  programs.newsboat = {
    enable = true;
    browser = "linkhandler";
    extraConfig =
      builtins.readFile ./confs/keybinds.conf
      + builtins.readFile ./confs/colors.conf
      # + builtins.readFile ./confs/browser.conf
    ;
  };
}
