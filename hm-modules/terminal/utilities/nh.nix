{ lib
, config
, ...
}:
let
  cfg = config.neb.terminal.utilities.nh;
in
{
  options.neb.terminal.utilities.nh = {
    enable = lib.mkEnableOption "enable nh";
  };

  config = lib.mkIf cfg.enable {
    home.sessionVariables = { FLAKE = lib.mkDefault "/home/nebu/.nix-config"; };
    programs = {
      nh.enable = true;
      zsh.completionInit =
        builtins.readFile ./nh_completions.zsh;
    };
  };
}
