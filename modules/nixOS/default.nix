{ inputs, ... }:

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
    ./pam.nix
    ./sddm.nix
    ./system.nix
    ./users
    ./virtualisation
  ];

  # TODO: move elsewhere
  environment.systemPackages = [ inputs.nixvim-flake.packages.x86_64-linux.default ];

  # environment.systemPackages = [
  #   # (pkgs.callPackage ../../pkgs/wshowkeys.nix { })
  # ];
  #
  # programs.wshowkeys.enable = true;
}
