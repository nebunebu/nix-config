{ inputs, modulesPath, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../../modules/nixOS
      # ./impermanence/nixos.nix
      inputs.home-manager.nixosModules.default
      # "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    ];

  nixpkgs.config.allowUnfree = true;

  app.virt-manager.enable = true;
  networking.hostName = "t5610";
  environment = {
    sessionVariables = {
      HOSTNAME = "t5610";
    };
    etc."machine-id" = {
      text = "4d1db5f3ed1d4094993faef0f4926a74";
      mode = "0444";
    };
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  desktop.hyprland.enable = true;
}
