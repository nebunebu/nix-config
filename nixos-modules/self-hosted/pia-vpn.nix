{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nix-pia-vpn.nixosModules.default
  ];

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
}
