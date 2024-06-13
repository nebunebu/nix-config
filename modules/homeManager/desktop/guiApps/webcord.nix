{ lib, unstablePkgs, pkgs, ... }:

{
  home.packages = [
    # override icon?
    # unstablePkgs.arrpc
    # unstablePkgs.webcord
    # unstablePkgs.discover-overlay
    # unstablePkgs.armcord

    # CREDIT: https://github.com/raidenovich/OuterHeaven/blob/850546a45382efd76a1776a988e278dc4c7fac3b/modules/home-manager/gui/vesktop.nix#L4
    (unstablePkgs.vesktop.overrideAttrs {
      # withSystemVencord = true;
      desktopItems = [
        (pkgs.makeDesktopItem {
          name = "vesktop";
          desktopName = "Vesktop";
          # exec = "vesktop %U";
          exec = "vesktop --enable-features=VaapiIgnoreDriverChecks,VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,UseMultiPlaneFormatForHardwareVideo";
          # still using vektop icon
          icon = "discord";
          startupWMClass = "VencordDesktop";
          genericName = "Internet Messenger";
          keywords = [ "discord" "vencord" "electron" "chat" ];
          categories = [ "Network" "InstantMessaging" "Chat" ];
        })
      ];
    })
  ];
}
