{ pkgs, lib, ... }:
{
  stylix.targets.grub.useWallpaper = true;
  boot = {
    plymouth = {
      enable = true;
      theme = lib.mkForce "hexagon_2";
      themePackages = [
        (pkgs.adi1090x-plymouth-themes.override { selected_themes = [ "hexagon_2" ]; })
      ];
    };
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        backgroundColor = lib.mkForce "#191724";
        # TODO: use a different font
        # font = lib.mkForce "${pkgs.ibm-plex}/share/fonts/opentype/IBMPlexMono-Text.otf";
        fontSize = lib.mkForce 16;
        # gfxmodeEfi = "1366x768";
        gfxpayloadEfi = "keep";
        efiSupport = true;
        device = "nodev";
      };
    };
  };
}
