# { pkgs, ... }:
{
  imports = [
    # ./discord.nix
    # ./dotool.nix
    # ./sops.nix
    # ./tuir.nix
    ./boot.nix
    ./console.nix
    ./hyprland.nix
    ./networking.nix
    ./nix.nix
    ./nixvim
    ./pam.nix
    ./sddm.nix
    ./system.nix
    ./users
    ./virtualisation
  ];

  # environment.systemPackages = [
  #   # (pkgs.callPackage ../../pkgs/wshowkeys.nix { })
  # ];
  #
  # programs.wshowkeys.enable = true;
}
