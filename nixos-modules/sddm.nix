{ lib
, config
, inputs
, pkgs
, ...
}:
let
  cfg = config.neb.desktop.sddm;
in
{

  imports = [ inputs.sddm-sugar-candy-nix.nixosModules.default ];

  options = {
    neb.desktop.sddm.enable = lib.mkEnableOption "enable fzf";
  };

  config = lib.mkIf cfg.enable
    {
      environment.systemPackages = [ pkgs.libsForQt5.qt5.qtgraphicaleffects ];
      services = {
        displayManager.sddm = {
          enable = true;
          wayland.enable = true;
          theme = "sddm-sugar-candy-nix";
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
              MainColor = "#e0def4";
              AccentColor = "#f6c177";
              BackgroundColor = "#191724";
              HourFormat = "hh:mm";
              OverrideLoginButtonTextColor = "white";
              Font = "IBM Plex";
            };
          };
        };
      };
    };
}
