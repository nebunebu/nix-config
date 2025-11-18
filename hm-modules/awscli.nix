{ lib, config, ... }:

let
  cfg = config.hm.dev.awscli;
in
{
  options.hm.dev.awscli = {
    enable = lib.mkEnableOption "enable awsclie";
  };

  config = lib.mkIf cfg.enable {
    programs.awscli = {
      enable = true;
      # credentials = {};
      # settings = {
      #   "default" = {
      #     region = "us-east-1";
      #     output = "json";
      #   };
      # };
    };

  };
}
