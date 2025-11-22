{ config, lib, ... }:
let
  cfg = config.nos.documentation;
in
{
  options.nos.documentation = {
    enable = lib.mkEnableOption "enable documentation configuration";
  };

  config = lib.mkIf cfg.enable {
    documentation = {
      enable = true;
      dev = {
        enable = true;
      };
      info.enable = true;
      man = {
        enable = true;
        generateCaches = true;
      };
    };
  };
}
