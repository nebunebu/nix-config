{
  inputs,
  pkgs,
  config,
  ...
}:

{
  imports = [
    inputs.impermanence.nixosModules.impermanence
    inputs.home-manager.nixosModules.default
    ./persistence.nix
    ./disko.nix
    "${inputs.self}/nixos-modules"
    # ../../../sops
  ];

  neb = {
    stylix.enable = true;
  };

  networking.hostName = "m715q";
  environment = {
    sessionVariables = {
      HOSTNAME = "m715q";
    };
  };

  # boot.kernelParams = [
  #   "i915.enable_fbc=1" # Enable frame buffer compression
  #   "i915.enable_psr=2" # Enable panel self-refresh
  #   "i915.fastboot=1" # Enable fast boot
  # ];
}
