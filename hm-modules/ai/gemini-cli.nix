{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.hm.ai.gemini-cli;
in
{
  options.hm.ai.gemini-cli = {
    enable = lib.mkEnableOption "enable gemini-cli";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      inputs.gemini-cli.packages."${pkgs.stdenv.hostPlatform.system}".default
    ];
  };
}
