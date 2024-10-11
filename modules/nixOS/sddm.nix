{ inputs
, pkgs
, ...
}:

{
  imports = [ inputs.sddm-sugar-candy-nix.nixosModules.default ];

  environment.systemPackages = [ pkgs.qt5.qtvirtualkeyboard ];

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
          Font = "Droid Sans";
        };
      };
    };
  };
}
