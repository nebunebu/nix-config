{ self, inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
    "${self}/modules/nixOS"
    ../../../modules/nixOS/stylix.nix
    ./hardware-configuration.nix
    ./remoteBuilder.nix
  ];

  sops.enable = true;

  desktop.hyprland.enable = true;

  networking.hostName = "x230t";
  environment = {
    sessionVariables = {
      HOSTNAME = "x230t";
    };
    etc."machine-id" = {
      text = "78565725a9e64e86b54c846719ef1aa4";
      mode = "0444";
    };
  };
}
