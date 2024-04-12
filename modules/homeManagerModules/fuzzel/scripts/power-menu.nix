{ pkgs, ... }: {
  home.packages = [
    (pkgs.writeShellScriptBin "power-menu" ''
      SELECTION=$(echo -e "screen off\nreboot\nshutdown" | fuzzel -d -p " " -w 15 -l 3)

      reboot_confirm() {
        SELECTION=$(echo -e "confirm reboot\ncancel reboot" | fuzzel -d -p " " -w 15 -l 2)
        case $SELCTION in
          "confirm reboot")
            reboot
            ;;
          *)
            ;;
        esac
      }

      shutdown_confirm() {
        SELECTION=$(echo -e "confirm shutdown\ncancel shutdown" | fuzzel -d -p " " -w 15 -l 2)
        case $SELCTION in
          "confirm shutdown")
            reboot
            ;;
          *)
            ;;
        esac
      }

      case $SELECTION in
        "screen off")
          hyprctl dispatch dpms off
          ;;
        "reboot")
          reboot_confirm
          ;;
        "Shutdown")
          shutdown_confirm
          ;;
        *)
          ;;
      esac
    '')
  ];
}
