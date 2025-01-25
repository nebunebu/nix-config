{ lib
, config
, ...
}:
let
  cfg = config.neb.development;
in
{
  imports = [
    ./awscli.nix
    ./direnv.nix
    ./git.nix
    ./go.nix
    ./repomix.nix
  ];

  options.neb.profile.development = {
    enable = lib.mkEnableOption "enable development profile";
  };

  config = lib.mkIf cfg.enable {
    neb.development = {
      awscli.nix = false;
      # FIX: direnv duplicated in terminal.utilities
      direnv.nix = false;
      git.nix = true;
      go.nix = false;
      repomix.nix = true;
    };
  };
}
