{
  self,
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
    ./disko.nix
  ];

  services = {
    gvfs.enable = true;
    upower.enable = true;
    blueman.enable = true;
  };

  boot.loader = {
    grub = {
      enable = true;
      devices = [ "nodev" ];
      # This firmware only offers generic NVMe0/NVMe1 entries, which boot the
      # removable fallback path. Requires canTouchEfiVariables = false.
      efiInstallAsRemovable = true;
    };
    efi = {
      efiSysMountPoint = "/boot";
      canTouchEfiVariables = false;
    };
  };

  swapDevices = [ ];

  nos = {
    boot.enable = true;
    thunar.enable = true;
    console.enable = true;
    networking.enable = true;
    manpager.enable = true;
    nix.enable = true;
    system.enable = true;
    sops.enable = true;
    desktop = {
      hyprland.enable = true;
      pipewire.enable = true;
    };
    obs.enable = true;
    stylix.enable = true;
    udisks2.enable = true;
    tlp.enable = true;
    users.acgp.enable = true;
    users.nebu.enable = true;
  };

  programs.zsh.enable = true;

  nixpkgs.hostPlatform = "x86_64-linux";
}
