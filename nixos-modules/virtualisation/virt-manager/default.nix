{ lib, config, ... }:

let
  cfg = config.neb.virtualisation.virt-manager;
in
{
  options.neb.virtualisation.virt-manager = {
    enable = lib.mkEnableOption "enable virt-manager";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
    users.users.nebu.extraGroups = [ "libvirtd" ];

    home-manager.users.nebu.dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };
    };
  };

  #   programs.virt-manager.enable = true;
  #   services.spice-vdagentd.enable = true;
  #   networking.firewall.trustedInterfaces = [ "virbr0" ];
  #   programs.dconf.enable = true;
  #   virtualisation = {
  #     libvirtd = {
  #       enable = true;
  #       onBoot = "start";
  #       qemu = {
  #         ovmf.enable = true;
  #         swtpm.enable = true;
  #       };
  #
  #
  #       # extraConfig = ''
  #       #   <network>
  #       #     <name>default</name>
  #       #     <bridge name="virbr0"/>
  #       #     <forward mode="nat"/>
  #       #     <ip address="192.168.122.1" netmask="255.255.255.0">
  #       #       <dhcp>
  #       #         <range start="192.168.122.2" end="192.168.122.254"/>
  #       #       </dhcp>
  #       #     </ip>
  #       #   </network>
  #       # '';
  #     };
  #   };
  # };
}
