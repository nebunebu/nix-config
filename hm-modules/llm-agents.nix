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
      # Autonomous AI
      # inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".openclaw
      # inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".zeroclaw
      inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".gemini-cli
      inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".opencode
      inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".backlog-md
    ];
  };
}
