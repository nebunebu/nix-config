{
  self,
  pkgs,
  inputs,
  config,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.default
    "${self}/nixos-modules"
    ../../../sops
    ./hardware-configuration.nix
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

  boot.kernelParams = [
    "i915.enable_fbc=1" # Enable frame buffer compression
    "i915.enable_psr=2" # Enable panel self-refresh
    "i915.fastboot=1" # Enable fast boot
  ];
}
