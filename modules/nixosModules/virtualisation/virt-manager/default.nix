{ config, lib, pkgs, ... }:

{
  options = {
    app.virt-manager.enable = lib.mkEnableOption "enable virt-manager";
  };

  config = lib.mkIf config.app.virt-manager.enable {
    users.users.nebu.extraGroups = [ "libvirtd" ];
    programs.virt-manager.enable = true;
    services.spice-vdagentd.enable = true;
    networking.firewall.trustedInterfaces = [ "virbr0" ];
    virtualisation = {
      libvirtd.enable = true;
      libvirtd.onBoot = "start";
    };
  };
}
