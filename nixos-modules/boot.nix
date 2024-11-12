{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };
}

# NOTE: grub
# boot.loader.grub = {
#   enable = true;
#   efiSupport = true;
#   device = "nodev";
# };
