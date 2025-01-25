{ inputs, ... }:

{
  nix = {
    settings = {

      experimental-features = [ "nix-command flakes pipe-operators" ];
      auto-optimise-store = true;
      allowed-users = [ "@wheel" ];
      trusted-users = [ "@wheel" ];


      builders-use-substitutes = true;
      extra-substituters = [
        "https://anyrun.cachix.org"
      ];

      extra-trusted-public-keys = [
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
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
}
