{ lib
, config
, ...
}:
let
  cfg = config.neb.terminal.media;
in
{
  imports = [
    ./buku.nix
    ./newsboat
  ];

  options.neb.terminal.media = {
    enable = lib.mkEnableOption "enable terminal media profile";
  };

  config = lib.mkIf cfg.enable {
    neb.terminal.media = {
      buku.enable = true;
      newsboat.enable = true;
    };
  };
}
