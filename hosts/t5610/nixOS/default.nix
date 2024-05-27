{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
    ./hardware-configuration.nix
    ../../../modules/nixOS
    ./builder.nix
    ./jellyfin.nix
  ];

  environment.systemPackages = [ pkgs.qbittorrent ];

  # NOTE: probably duplicate
  nixpkgs.config.allowUnfree = true;

  sops.enable = true;
  tuir.enable = true;
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

  desktop.hyprland.enable = true;
}
