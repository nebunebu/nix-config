{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.hm.llm-agents;
in
{
  options.hm.llm-agents = {
    enable = lib.mkEnableOption "enable llm-agents";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".claude-code
      inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".codex
      inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".coding-agent-search
      inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".eca
      inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".gemini-cli
      inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".mistral-vibe
      inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".openskills
      inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".openspec
      inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".spec-kit
    ];
  };
}
