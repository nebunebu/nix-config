{
  services.qemuGuest.enable = true;

  xdg.portal.wlr.enable = true;

  virtualisation = {
    # qemu = {
    #   package = pkgs.qemu;
    #   options = [ "-device virtio-vga" ];
    #   # guestAgent.enable = true;
    # };
    # drives = [];

    vmVariant = {
      # following configuration is added only when building VM with build-vm
      virtualisation = {
        memorySize = 20000;
        cores = 10;
      };
    };
  };
}
