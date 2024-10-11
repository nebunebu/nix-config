{ inputs }:

final: prev: {
  tool-suites = import inputs.tool-suites.overlay final prev;

  # lib = builtins.trace "Extending lib with utils" prev.lib.extend (final: _: {
  #   utils = builtins.trace "Importing utils" import ../lib/utils.nix { inherit (final) lib; pkgs = final; };
  # });

  # customPackages
  # versionOverrides
  # packagePatches
  # hyprpanel

}
