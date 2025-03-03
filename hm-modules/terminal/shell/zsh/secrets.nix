{ config, lib, ... }:
let
  secretPath = "${config.xdg.configHome}/zsh/secrets";
in
{
  sops = {
    secrets = {
      anthropic_api_key.path = "%r/test.txt";
      gemini_api_key.path = "%r/test.txt";
    };
    templates.api-keys = {
      name = "secrets";
      path = secretPath;
      mode = "0500";
      content = # bash
        ''
          export ANTHROPIC_API_KEY=${config.sops.placeholder.anthropic_api_key}
          export GEMINI_API_KEY=${config.sops.placeholder.gemini_api_key}
        '';
    };
  };

  programs.zsh.initExtra =
    lib.mkAfter # bash
      ''
        if [ -f "${secretPath}" ]; then
          source "${secretPath}"
        fi
      '';
}
