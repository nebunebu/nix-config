{ pkgs, checks }:

pkgs.mkShell {
  name = "nix-config";
  packages = [
    pkgs.convco
    pkgs.nixfmt-rfc-style
    pkgs.deadnix
    pkgs.statix
  ];
  inherit (checks.pre-commit-check) shellHook;
  buildInputs = checks.pre-commit-check.enabledPackages;
}
