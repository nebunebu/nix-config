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
    thirteenft.enable = true;
    stylix.enable = true;
    sops = {
      enable = true;
      gpg = {
        enable = true;
      };
      pass.enable = true;
    };
    cloudflared.enable = true;
    freshrss.enable = true;
    glance.enable = true;
    jellyfin.enable = true;
    linkding.enable = true;
    n8n.enable = true;
    pinchflat.enable = true;
    qbittorrent.enable = true;
    beaverhabits.enable = true;
    # dumbkan.enable = true;
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
