{ lib, config, ... }:

let
  cfg = config.opts.dev.go;
in
{
  options.opts.dev.go = {
    enable = lib.mkEnableOption "enable go";
  };

  config = lib.mkIf cfg.enable {
    programs.go = {
      enable = true;
      env = {
        GOBIN = ".config/go/bin.go";
        GOPath = ".config/go/go";
      };
    };
  };
}
