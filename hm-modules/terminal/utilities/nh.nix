{ inputs
, lib
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
    programs = {
      nh = {
        enable = true;
        flake = inputs.self;
      };
      zsh.completionInit =
        builtins.readFile ./nh_completions.zsh;
    };
  };
}
