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

  services.printing = {
    enable = true;
    drivers = [ pkgs.brlaser ];
  };
  services.ipp-usb.enable = true;
  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.sane-airscan ];
  };

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
  };
}
