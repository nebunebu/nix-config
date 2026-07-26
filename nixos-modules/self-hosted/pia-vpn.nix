{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nos.self-hosted.pia-vpn;
in
{
  imports = [
    inputs.nix-pia-vpn.nixosModules.default
  ];

  options.nos.self-hosted.pia-vpn = {
    enable = lib.mkEnableOption "PIA VPN";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.wireguard-tools
    ];

    sops.secrets.pia = { };

    services.pia-vpn = {
      enable = true;
      certificateFile = builtins.fetchurl {
        url = "https://www.privateinternetaccess.com/openvpn/ca.rsa.4096.crt";
        sha256 = "1av6dilvm696h7pb5xn91ibw0mrziqsnwk51y8a7da9y8g8v3s9j";
      };
      environmentFile = config.sops.secrets.pia.path;
    };

    # networking.firewall.checkReversePath = "loose";
  };
}
