{ self
, inputs
, pkgs
, ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.default
    ./hardware-configuration.nix
    "${self}/nixos-modules"
    ./builder.nix
  ];

  # programs.river.enable = true;

  services = {
    gvfs.enable = true;
    # NOTE: required for spotube
    gnome.at-spi2-core.enable = true;
  };

  environment.systemPackages = [
    # TODO: move this to its own modules
    # pkgs.qbittorrent
    pkgs.calibre
    # https://flozz.github.io/rivalcfg/devices/rival3.html
    pkgs.rivalcfg
    # (pkgs.callPackage ../../../pkgs/super-productivity.nix { })
    pkgs.foot
  ];

  sops.enable = true;
  tuir.enable = true;
  app.virt-manager.enable = true;
  neb = {
    amdgpu.enable = true;
    desktop = {
      sddm.enable = false;
      hyprland.enable = true;
      # stylix.enable = true;
    };
  };

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

}
