{
  lib,
  config,
  ...
}:
let
  cfg = config.neb.profile.development;
in
{
  imports = [
    ./awscli.nix
    ./claude.nix
    ./git.nix
    ./go.nix
    # ./repomix.nix
  ];

  options.neb.profile.development = {
    enable = lib.mkEnableOption "enable development profile";
  };

  config = lib.mkIf cfg.enable {
    neb.development = {
      awscli.enable = false;
      claude.enable = true;
      git.enable = true;
      go.enable = true;
      # repomix.enable = true;
    };
  };
}
