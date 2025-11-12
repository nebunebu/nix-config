{ lib, config, ... }:

let
  cfg = config.opts.dev.awscli;
in
{
  options.opts.dev.awscli = {
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
