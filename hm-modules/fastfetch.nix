{ lib, config, ... }:
let
  cfg = config.hm.fastfetch;
in
{
  options.hm.fastfetch = {
    enable = lib.mkEnableOption "enable fastfetch";
  };

  config = lib.mkIf cfg.enable {
    programs.fastfetch = {
      enable = true;
      # settings = {
      #   logo = {
      #     source = "nixos_small";
      #   };
      #   display = { };
      # };
    };
  };
}
