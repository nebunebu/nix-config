{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.nos.boot;
in
{
  options.nos.boot = {
    enable = lib.mkEnableOption "enable boot configuration";
  };

  config = lib.mkIf cfg.enable {
    # The boot theming here is owned by hand, so the stylix targets are off
    # rather than overridden -- previously both fought (grub.useWallpaper was
    # set two lines above a forced backgroundColor), and forced base values
    # would also beat any future light-theme specialisation.
    stylix.targets = {
      grub.enable = false;
      plymouth.enable = false;
    };

    boot = {
      plymouth = {
        enable = true;
        theme = "hexagon_2";
        themePackages = [
          (pkgs.adi1090x-plymouth-themes.override { selected_themes = [ "hexagon_2" ]; })
        ];
      };
      loader = {
        # mkDefault: hosts state their own (antillia's firmware needs false).
        efi.canTouchEfiVariables = lib.mkDefault true;
        grub = {
          enable = true;
          backgroundColor = "#191724";
          # TODO: use a different font
          # font = "${pkgs.ibm-plex}/share/fonts/opentype/IBMPlexMono-Text.otf";
          fontSize = 16;
          # gfxmodeEfi = "1366x768";
          gfxpayloadEfi = "keep";
          efiSupport = true;
        };
      };
    };
  };
}
