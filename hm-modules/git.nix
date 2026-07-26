{ lib, config, ... }:
let
  cfg = config.hm.git;
in
# gpgCfg = config.opt.security.gpg;
{
  options.hm.git = {
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
            email = "nebu.nebuchadnezzar@gmail.com";
            name = "nebunebu";
          };
          # signing = {
          #   key = lib.mkIf gpgCfg.enable gpgCfg.key;
          #   signByDefault = true;
          # };
          init.defaultBranch = "main";
          # `settings` is the freeform gitconfig tree, so these are the real
          # section names -- nesting them under `aliases`/`extraConfig` (the old
          # sibling options) writes [aliases] and [extraConfig "init"], which git
          # ignores.
          alias = {
            st = "status";
            ap = "add -p";
            p = "push";
            b = "branch";
            sw = "switch";
            # `!` prefix: needs a shell for the command substitution.
            rma = "!git rm --cached $(git ls-files --deleted)";
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
