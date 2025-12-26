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

  networking.firewall.allowedTCPPorts = [
    8384
  ];
  serve = {
    navidrome.enable = true;
  };

  nos = {
    udisks2.enable = true;
    thirteenft.enable = true;
    invidious.enable = false;
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
    # ollama.enable = true;

    # desktop = {
    #   hyprland.enable = true;
    #   pipewire.enable = true;
    # };
  };

  networking.hostName = "bermeja";
}
