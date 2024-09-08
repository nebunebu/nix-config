{ lib, pkgs, ... }:

{
  # fromYAML = file:
  #   let
  #     json = pkgs.runCommand "converted.json" { } ''
  #       ${lib.meta.getExe pkgs.yj} < ${file} > $out
  #     '';
  #   in
  #   builtins.fromJSON (builtins.readFile json);
  #
  # TODO: add
  # mkHost
  # mapSystems
}
