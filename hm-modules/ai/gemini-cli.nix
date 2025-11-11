{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.development.gemini-cli;
in
{
  options.development.gemini-cli = {
    enable = lib.mkEnableOption "enable gemini-cli";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      inputs.gemini-cli.packages."${pkgs.stdenv.hostPlatform.system}".default
    ];
  };
}
