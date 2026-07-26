{ config, lib, ... }:
let
  secretPath = "${config.xdg.configHome}/zsh/secrets";
in
{
  config = lib.mkIf config.hm.shell.zsh.enable {
    sops = {
      # Only the template below consumes these, so they keep their default
      # per-secret paths under the sops runtime dir.
      secrets = {
        anthropic_api_key = { };
        gemini_api_key = { };
        gh_api = { };
      };
      templates.api-keys = {
        name = "secrets";
        path = secretPath;
        mode = "0500";
        content = # bash
          ''
            export CLAUDE_API_KEY=${config.sops.placeholder.anthropic_api_key}
            export ANTHROPIC_API_KEY=${config.sops.placeholder.anthropic_api_key}
            export GEMINI_API_KEY=${config.sops.placeholder.gemini_api_key}
            export GH_TOKEN=${config.sops.placeholder.gh_api}
          '';
      };
    };

    programs.zsh.initContent =
      lib.mkAfter # bash
        ''
          if [ -f "${secretPath}" ]; then
            source "${secretPath}"
          fi
        '';
  };
}
