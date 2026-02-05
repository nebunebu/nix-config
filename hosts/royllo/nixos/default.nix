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
    "${self}/users/acgp"
    "${self}/users/nebu"
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

  nos = {
    boot.enable = true;
    console.enable = true;
    networking.enable = true;
    nix.enable = true;
    system.enable = true;
    sops = {
      enable = true;
      gpg.enable = true;
      pass.enable = true;
    };
    desktop = {
      hyprland.enable = true;
      pipewire.enable = true;
    };
    obs.enable = true;
    stylix.enable = true;
    udisks2.enable = true;
    users.acgp.enable = true;
    users.nebu.enable = true;
  };

  programs.zsh.enable = true;

  networking.hostName = "royllo";
  # networking.firewall.checkReversePath = "loose";

}
