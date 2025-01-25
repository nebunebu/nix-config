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
    ./pyradio.nix
    ./newsboat
  ];

  options.neb.terminal.media = {
    enable = lib.mkEnableOption "enable terminal media profile";
  };

  config = lib.mkIf cfg.enable {
    neb.terminal.media = {
      buku.enable = true;
      pyradio.enable = true;
      newsboat.enable = true;
    };
  };
}
