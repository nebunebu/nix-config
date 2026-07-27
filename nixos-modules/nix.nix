{
  inputs,
  config,
  lib,
  ...
}:
let
  cfg = config.nos.nix;
in
{
  options.nos.nix = {
    enable = lib.mkEnableOption "enable nix configuration";
  };

  config = lib.mkIf cfg.enable {
    nix = {
      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
          "pipe-operators"
        ];
        auto-optimise-store = true;
        allowed-users = [ "@wheel" ];
        trusted-users = [ "@wheel" ];

        builders-use-substitutes = true;

        extra-substituters = [
          "https://cache.numtide.com"
          "https://nix-community.cachix.org"
          "https://numtide.cachix.org"
        ];

        extra-trusted-public-keys = [
          "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
        ];
      };
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
      nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    };
    nixpkgs.config.allowUnfree = true;
  };
}
