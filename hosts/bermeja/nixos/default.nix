{
  self,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.default
    ./hardware-configuration.nix
    "${inputs.self}/nixos-modules"
    "${self}/users/nebu"
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
    boot.enable = true;
    console.enable = true;
    documentation.enable = true;
    networking.enable = true;
    nix.enable = true;
    system.enable = true;
    udisks2.enable = true;
    stylix.enable = true;
    users.nebu.enable = true;
    sops = {
      enable = true;
      gpg = {
        enable = true;
      };
      pass.enable = true;
    };

    self-hosted = {
      beaverhabits.enable = true;
      cloudflared.enable = true;
      freshrss.enable = true;
      glance.enable = true;
      invidious.enable = false;
      jellyfin.enable = true;
      linkding.enable = true;
      n8n.enable = true;
      ollama.enable = true;
      pinchflat.enable = false;
      qbittorrent.enable = true;
      thirteenft.enable = true;
    };
  };

  virtualisation.docker.enable = true;

  networking.hostName = "bermeja";
}
