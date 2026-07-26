{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
let
  cfg = config.nos.manpager;

  nvimPkg = inputs.nebvim.packages."${pkgs.stdenv.hostPlatform.system}".manvim;
  nvimBin = "${nvimPkg}/bin/nvim";

  nvimPager = pkgs.writeShellScriptBin "nvim-man-pager" ''
    set -euo pipefail

    exec "${nvimBin}" -c "set ft=man" -
  '';
in
{
  options.nos.manpager = {
    enable = lib.mkEnableOption "use nebvim's manvim as MANPAGER";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ nvimPager ];
    environment.variables.MANPAGER = "${nvimPager}/bin/nvim-man-pager +Man!";
  };
}
