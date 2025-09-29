{
  inputs,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.default
    ./hardware-configuration.nix
    "${inputs.self}/nixos-modules"
    "${inputs.self}/serve"
    ../../../sops
  ];

  neb = {
    udisks2.enable = true;
    stylix.enable = true;
    sops = {
      enable = true;
      # taskwarrior.enable = true;
      gpg = {
        enable = true;
      };
      pass.enable = true;
    };
    # karakeep.enable = true;
    glance.enable = true;
    pinchflat.enable = true;
    jellyfin.enable = true;
    qbittorrent.enable = true;
    # beaverhabits.enable = true;
    # dumbkan.enable = true;
    # freshrss.enable = false;
    # linkding.enable = true;
    # ollama.enable = true;
  };

  networking.hostName = "m715q";
  environment = {
    sessionVariables = {
      HOSTNAME = "m715q";
    };
  };
}
