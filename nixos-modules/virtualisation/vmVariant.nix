{ config, lib, ... }:
let
  cfg = config.nos.virtualisation.vmVariant;
in
{
  options.nos.virtualisation.vmVariant = {
    enable = lib.mkEnableOption "enable vmVariant configuration";
  };

  config = lib.mkIf cfg.enable {
    services.qemuGuest.enable = true;

    virtualisation = {
      # qemu = {
      # options = [ "-device virtio-vga" ];
      # guestAgent.enable = true;
      # };
      # drives = [];

      vmVariant = {
        # following configuration is added only when building VM with build-vm
        # home-manager.users.nebu.home.homeDirectory = "/home/nebu";
        virtualisation = {
          memorySize = 8096;
          cores = 8;
        };
      };
    };

  };
}
