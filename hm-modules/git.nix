{ lib, config, ... }:
let
  cfg = config.opts.git;
in
# gpgCfg = config.opt.security.gpg;
{
  options.opts.git = {
    enable = lib.mkEnableOption "enable git";

  };

  config = lib.mkIf cfg.enable {
    # NOTE: def lot could be added for qol
    programs = {
      delta = {
        enable = true;
        enableGitIntegration = true;
      };
      git = {
        ignores = [
          ".direnv"
        ];
        enable = true;
        settings = {
          user = {
            email = "optu.optuchadnezzar@gmail.com";
            name = "optuoptu";
          };
          # signing = {
          #   key = lib.mkIf gpgCfg.enable gpgCfg.key;
          #   signByDefault = true;
          # };
          extraConfig = {
            init.defaultBranch = "main";
          };
          aliases = {
            st = "status";
            ap = "add -p";
            p = "push";
            b = "branch";
            sw = "switch";
            # git rm --cached $(git ls-files --deleted)
            rma = "rm --cached $(git ls-file --deleted)";
          };
        };

      };
      gh = {
        enable = true;
        settings = {
          editor = "nvim";
          git_protocol = "ssh";
        };
      };
      gh-dash = {
        enable = true;
      };

    };
  };
}
