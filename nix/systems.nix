# Systems the per-system flake outputs are exposed for.
#
# Without this the outputs are generated for every system in
# `nixpkgs.legacyPackages` -- 10 of them, including x86_64-freebsd, where the
# treefmt wrapper does not evaluate (black is unsupported there). That makes
# `nix flake check --all-systems` fail on outputs nothing actually uses.
rec {
  linux = [
    "x86_64-linux"
    "aarch64-linux"
  ];

  darwin = [
    "x86_64-darwin"
    "aarch64-darwin"
  ];

  # Tooling outputs (formatter, devShells, checks) work anywhere.
  all = linux ++ darwin;
}
