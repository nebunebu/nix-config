{ inputs, ... }:

{
  nix = {
    settings = {
      experimental-features = [ "nix-command flakes" ];
      auto-optimise-store = true;
      allowed-users = [ "@wheel" ];
      trusted-users = [ "@wheel" ];
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
