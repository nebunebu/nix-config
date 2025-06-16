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
  services.upower.enable = true;

  neb = {
    desktop = {
      hyprland.enable = true;
      pipewire.enable = true;
      sddm.enable = true;
    };
    obs.enable = true;
    stylix.enable = true;
    udisks2.enable = true;
  };

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
