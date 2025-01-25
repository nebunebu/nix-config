{ lib
, config
, ...
}:
let
  cfg = config.neb.terminal.file-navigation;
in
{
  imports = [
    ./lf.nix
    ./yazi.nix
  ];

  options.neb.terminal.file-navigation = {
    enable = lib.mkEnableOption "enable terminal file-navigation profile";
  };

  config = lib.mkIf cfg.enable {
    neb.terminal.file-navigation = {
      lf.enable = false;
      yazi.enable = true;
    };
  };
}
