{ self, pkgs, unstablePkgs, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
    "${self}/nixos-modules"
    ./hardware-configuration.nix
    ./remoteBuilder.nix
  ];

  sops.enable = true;

  neb = {
    stylix.enable = true;
    #   amdgpu.enable = true;
    desktop = {
      sddm.enable = false;
      hyprland.enable = true;
      pipewire.enable = true;
    };
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

  hardware = {
    hardware = {
      enable = true;
      package = unstablePkgs.mesa.drivers;
      extraPackages = [
        pkgs.intel-media-driver
        pkgs.vaapiIntel
        pkgs.libvdpau-va-gl
        pkgs.intel-compute-runtime
      ];
      extraPackages32 = [ pkgs.vaapiIntel pkgs.intel-media-driver ];
    };
  };
  boot.kernelParams = [
    "i915.enable_fbc=1" # Enable frame buffer compression
    "i915.enable_psr=2" # Enable panel self-refresh
    "i915.fastboot=1" # Enable fast boot
  ];
}
