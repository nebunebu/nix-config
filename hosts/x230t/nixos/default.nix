{
  self,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.default
    "${self}/nixos-modules"
    ../../../sops
    ./hardware-configuration.nix
    # ./nextcloud.nix
    ./hp_envy.nix
    ./ads_1300.nix
  ];

  services = {
    gvfs.enable = true;
    upower.enable = true;
    blueman.enable = true;
    power-profiles-daemon.enable = true;
  };

  programs.thunar = {
    enable = true;
    plugins = [
      pkgs.xfce.thunar-archive-plugin
      pkgs.xfce.thunar-volman
      pkgs.xfce.thunar-media-tags-plugin
      pkgs.xfce.thunar-vcs-plugin
    ];
  };

  neb = {
    desktop = {
      hyprland.enable = true;
      pipewire.enable = true;
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
