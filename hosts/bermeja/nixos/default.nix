{
  inputs,
  pkgs,
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

  environment.systemPackages = [
    inputs.nebvim.packages."${pkgs.stdenv.hostPlatform.system}".default
    inputs.direnv-instant.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.ghostty.terminfo
    pkgs.kitty.terminfo
  ];

  networking.firewall.allowedTCPPorts = [
    8384
  ];

  # serve = {
  #   navidrome.enable = true;
  # };

  nos = {
    avahi.enable = true;
    boot.enable = true;
    console.enable = true;
    documentation.enable = true;
    networking.enable = true;
    nix.enable = true;
    system.enable = true;

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

  virtualisation.docker.enable = true;

  networking.hostName = "bermeja";
}
