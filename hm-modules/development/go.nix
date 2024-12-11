{ lib, config, ... }:

let
  cfg = config.neb.developemnt.go;
in
{
  options.neb.developemnt.go = {
    enable = lib.mkEnableOption "enable go";
  };

  config = lib.mkIf cfg.enable {
    programs.go = {
      enable = true;
      goBin = ".config/go/bin.go";
      goPath = ".config/go/go";
    };
  };
}
