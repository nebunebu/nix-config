{ pkgs, inputs, ... }:
let
  nvimPkg = inputs.nebvim.packages."${pkgs.stdenv.hostPlatform.system}".manvim;
  nvimBin = "${nvimPkg}/bin/nvim";

  nvimPager = pkgs.writeShellScriptBin "nvim-man-pager" ''
    #!/usr/bin/env bash
    set -euo pipefail

    exec "${nvimBin}" -c "set ft=man" -
  '';
in
{
  environment.systemPackages = [ nvimPager ];
  environment.variables.MANPAGER = "${nvimPager}/bin/nvim-man-pager +Man!";
}
