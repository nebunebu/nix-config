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
    # ./claude-code.nix
    # ./gemini-cli.nix
  ];

  options.hm.ai = {
    enable = lib.mkEnableOption "enable ai";
  };

  config = lib.mkIf cfg.enable {

    home.packages = [
      inputs.nix-ai-tools.packages."${pkgs.stdenv.hostPlatform.system}".claude-code
      inputs.nix-ai-tools.packages."${pkgs.stdenv.hostPlatform.system}".gemini-cli
      # inputs.nebvim.packages."${pkgs.stdenv.hostPlatform.system}".qwen-code
      inputs.claude-desktop.packages."${pkgs.stdenv.hostPlatform.system}".claude-desktop
    ];
    hm.ai = {
      aichat.enable = true;
      # claude-code.enable = true;
      # gemini-cli.enable = true;
    };
  };
}
