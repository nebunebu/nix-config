{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.desktop.communications.vesktop;
in
{
  options.neb.desktop.communications.vesktop = {
    enable = lib.mkEnableOption "enable vesktop";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      # CREDIT: https://github.com/raidenovich/OuterHeaven/blob/850546a45382efd76a1776a988e278dc4c7fac3b/modules/home-manager/gui/vesktop.nix#L4

      (
        (pkgs.vesktop.override {
          electron = pkgs.electron_33;
        }).overrideAttrs
        (_: {
          # withSystemVencord = true;
          desktopItems = [
            (pkgs.makeDesktopItem {
              name = "vesktop";
              desktopName = "Vesktop";
              exec = "vesktop --disable-gpu-memory-buffer-video-frames --disable-gpu-compositing --enable-features=WebRTCPipeWireCapturer --ozone-platform-hint=auto --use-gl=egl";
              startupWMClass = "VencordDesktop";
              genericName = "Internet Messenger";
              keywords = [
                "discord"
                "vencord"
                "electron"
                "chat"
              ];
              categories = [
                "Network"
                "InstantMessaging"
                "Chat"
              ];
            })
          ];
        })
      )
    ];
  };
}
