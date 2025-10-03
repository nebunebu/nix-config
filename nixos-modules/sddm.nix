{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
let
  cfg = config.neb.desktop.sddm;
in
{

  imports = [
    inputs.sddm-sugar-candy-nix.nixosModules.default
    inputs.rosepine.nixosModules.rosePine
  ];

  options = {
    neb.desktop.sddm.enable = lib.mkEnableOption "enable sddm-sugar-candy-nix";
  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages = [
      # pkgs.kdePackages.sddm
      pkgs.libsForQt5.qt5.qtgraphicaleffects
    ];

    services = {
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        sugarCandyNix = {
          enable = true;
          settings = {
            Background = builtins.fetchurl {
              url = "https://github.com/nebunebu/imgs/raw/main/wallpapers/nixos-rose-pine.png";
              sha256 = "084qgbicqiqwprb9m6l5jwij26rv8r73h76vba523z6q9rz0snlw";
            };
            HaveFormBackground = false;
            HeaderText = "Welcome!";
            FormPosition = "left";
            PartialBlur = true;
            MainColor = "#${config.rosePine.main.text}";
            AccentColor = "#${config.rosePine.main.gold}";
            BackgroundColor = "#${config.rosePine.main.base}";
            HourFormat = "hh:mm";
            OverrideLoginButtonTextColor = "white";
            Font = "IBM Plex";
          };
        };
      };
    };
  };
}
