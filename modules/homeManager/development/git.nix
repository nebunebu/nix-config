{ lib, config, ... }:
let
  cfg = config.neb.development.git;
in
{
  options.neb.development.git = {
    enable = lib.mkEnableOption "enable git";
  };

  config = lib.mkIf cfg.enable {
    # NOTE: def lot could be added for qol
    programs = {
      git = {
        enable = true;
        userEmail = "nebu.nebuchadnezzar@gmail.com";
        userName = "nebunebu";
        delta.enable = true;
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
