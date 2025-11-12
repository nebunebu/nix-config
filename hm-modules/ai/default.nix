{ lib, config, ... }:
let
  cfg = config.opts.ai;
in
{
  imports = [
    ./aichat
    ./claude-code.nix
    ./gemini-cli.nix
  ];

  options.opts.ai = {
    enable = lib.mkEnableOption "enable ai";
  };

  config = lib.mkIf cfg.enable {
    opts.ai = {
      aichat.enable = true;
      claude-code.enable = true;
      gemini-cli.enable = true;
    };
  };
}
