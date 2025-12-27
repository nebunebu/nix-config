{ config, lib, ... }:
let
  cfg = config.nos.networking;
in
{
  options.nos.networking = {
    enable = lib.mkEnableOption "enable networking configuration";
  };

  config = lib.mkIf cfg.enable {
    # networking.wireless.enable = true;
    networking.networkmanager = {
      enable = true;
    };
    # NetworkManager handles connectivity; avoid failing when networkd has no links.
    systemd.services."systemd-networkd-wait-online".enable = lib.mkForce false;
    programs = {
      zsh.enable = true;
      mtr.enable = true;
      gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
  };
}
