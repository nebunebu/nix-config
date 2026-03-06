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

    programs.opencode = {
      enable = true;
      package = inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".opencode;
    };

    home.packages = [
      # Autonomous AI
      # inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".openclaw
      # inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".zeroclaw
      # inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".jules
      # For Usage with Subscription
      # inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".claude-code
      # inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".codex
      inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".gemini-cli
      # Task Planning
      inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".backlog-md
      # Skills
      # inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".openskills
      # Editor Integration
      # inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".eca
      # Spec Driven Development
      # inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".cc-sdd
      # inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".openspec
      # inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".spec-kit
      # Code Review
      # inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".coderabbit
      # inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".tuicr
      # Browser Automation
      # inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".agent-browser
      # Other
      # inputs.llm-agents.packages."${pkgs.stdenv.hostPlatform.system}".qmd
    ];
  };
}
