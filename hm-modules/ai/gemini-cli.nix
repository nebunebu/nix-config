{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.opts.ai.gemini-cli;
in
{
  options.opts.ai.gemini-cli = {
    enable = lib.mkEnableOption "enable gemini-cli";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      inputs.gemini-cli.packages."${pkgs.stdenv.hostPlatform.system}".default
    ];
  };
}
