{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.hm.anki;
in
{
  options.hm.anki = {
    enable = lib.mkEnableOption "enable anki";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      (pkgs.writeShellScriptBin "anki-bin" ''
        ANKI_WAYLAND=1 exec ${pkgs.anki-bin}/bin/anki "$@"
      '')
    ];

    # Should add a mkIf for if hyprland is enabled as well

    wayland.windowManager.hyprland.settings.windowrulev2 = lib.mkForce [
      "float, size 90% 90%, center 1, initialClass:^(anki)$, initialTitle:^(Edit Current)$"
      "float, size 90% 90%, center 1, initialClass:^(anki)$, initialTitle:^(Add)$"
      "float, size 90% 90%, center 1, initialClass:^(anki)$, initialTitle:^(Anki)$"
      "float, size 90% 90%, center 1, initialClass:^(anki)$, initialTitle:^(Import File)$"
      "float, size 90% 90%, center 1, initialClass:^(anki)$, initialTitle:^(Add-ons)$"
      "float, size 90% 90%, center 1, initialClass:^(anki)$, initialTitle:^(Leech Toolkit.*)$"
    ];
  };
}
