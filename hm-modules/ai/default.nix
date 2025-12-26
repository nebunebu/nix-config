{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.hm.ai;
in
{
  imports = [
    ./aichat
  ];

  options.hm.ai = {
    enable = lib.mkEnableOption "enable ai";
  };

  config = lib.mkIf cfg.enable {

    home.packages = [
      inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".claude-code
      inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".gemini-cli
      inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".codex
      inputs.claude-desktop.packages."${pkgs.stdenv.hostPlatform.system}".claude-desktop
    ];
    hm.ai = {
      aichat.enable = true;
    };
  };
}
