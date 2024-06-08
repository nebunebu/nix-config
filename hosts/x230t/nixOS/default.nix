{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
    ./hardware-configuration.nix
    ../../../modules/nixOS
    ./remoteBuilder.nix
  ];
  sops.enable = true;

  # programs.hyprland.package = inputs.hyprland."${.hyprland-unwrapped;
  # home-manager.users.nebu.wayland.windowManager.hyprland.package = inputs.hyprland."${pkgs.system}".hyprland;

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
