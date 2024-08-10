{ self
, inputs
, lib
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
          Background = lib.cleanSource "${self}/modules/nixOS/sddm/nixos-rose-pine.png";
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
