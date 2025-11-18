{ lib, config, ... }:
let
  cfg = config.hm.fs-tools;
in
{
  imports = [
    ./bat.nix
    ./eza.nix
    ./fd.nix
    ./lf.nix
    ./ripgrep.nix
    ./yazi.nix
    ./zoxide.nix
  ];

  options.hm.fs-tools = {
    enable = lib.mkEnableOption "enable fs-tools";
  };

  config = lib.mkIf cfg.enable {
    opts.fs-tools = {
      bat.enable = true;
      eza.enable = true;
      fd.enable = true;
      lf.enable = true;
      ripgrep.enable = true;
      yazi.enable = true;
      zoxide.enable = true;
    };
  };
}
