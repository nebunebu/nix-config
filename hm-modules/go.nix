{ lib, config, ... }:

let
  cfg = config.hm.dev.go;
in
{
  options.hm.dev.go = {
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
