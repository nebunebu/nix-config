{
  lib,
  config,
  ...
}:
let
  cfg = config.hm.communications.vesktop;
in
{
  options.hm.communications.vesktop = {
    enable = lib.mkEnableOption "enable vesktop";
  };

  config = lib.mkIf cfg.enable {
    programs.vesktop = {
      enable = true;
      # settings = { };
      # vencord = {
      #   settings = { };
      #   themes = {};
      # };
    };
  };
}
