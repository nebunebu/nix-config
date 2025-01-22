{ lib, config, ... }:
let
  cfg = config.neb.terminal.utilities.fastfetch;
in
{
  options.neb.terminal.utilities.fastfetch = {
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
