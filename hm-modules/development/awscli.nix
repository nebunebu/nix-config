{ lib, config, ... }:

let
  cfg = config.neb.development.awscli;
in
{
  options.neb.development.awscli = {
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
