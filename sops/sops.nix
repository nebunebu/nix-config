{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.nos.sops;
in
{
  options.nos.sops.enable = lib.mkEnableOption "enable sops";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.sops ];

    sops = {
      defaultSopsFile = ./secrets/secrets.yaml;

      # System secrets decrypt with the host key -- `age.sshKeyPaths` already
      # defaults to /etc/ssh/ssh_host_ed25519_key, and .sops.yaml now lists all
      # three hosts as recipients. The user-level age key stays for the
      # home-manager sops module (hm-modules/sops.nix) only.
      #
      # TODO: remove once `sops updatekeys sops/secrets/secrets.yaml` has been
      # run and a deploy to bermeja has been confirmed to bring up freshrss,
      # pinchflat and pia-vpn. Until then this is the fallback that keeps them
      # decrypting; dropping it first would leave those services without secrets.
      age.keyFile = "/home/nebu/.config/sops/age/keys.txt";
    };
  };
}
