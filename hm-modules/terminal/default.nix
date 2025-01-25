{ lib
, config
, ...
}:
let
  cfg = config.neb.profile.terminal;
in
{
  imports = [
    ./media
    ./shell
    ./utilities
  ];

  options.neb.profile.terminal = {
    enable = lib.mkEnableOption "enable terminal profile";
  };

  config = lib.mkIf cfg.enable {
    neb.terminal = {
      media.enable = true;
      shell.enable = true;
      utilities.enable = true;
    };
  };
}
