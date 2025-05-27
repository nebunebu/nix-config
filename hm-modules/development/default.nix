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
    ./git.nix
    ./go.nix
  ];

  options.neb.profile.development = {
    enable = lib.mkEnableOption "enable development profile";
  };

  config = lib.mkIf cfg.enable {
    neb.development = {
      awscli.enable = false;
      git.enable = true;
      go.enable = true;
    };
  };
}
