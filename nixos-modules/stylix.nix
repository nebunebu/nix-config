{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.neb.stylix;
  fromYAML =
    file:
    let
      json = pkgs.runCommand "converted.json" { } ''
        ${lib.meta.getExe pkgs.yj} < ${file} > $out
      '';
    in
    builtins.fromJSON (builtins.readFile json);
in
{
  options.neb.stylix = {
    enable = lib.mkEnableOption "enable stylix";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.rose-pine-icon-theme # needs to be updated
      pkgs.morewaita-icon-theme
      pkgs.adwaita-icon-theme
    ];

    fonts.packages = [
      pkgs.ibm-plex
      pkgs.nerd-fonts.im-writing
      pkgs.nerd-fonts.blex-mono
    ];

    stylix = {
      enable = true;
      image = builtins.fetchurl {
        url = "https://github.com/nebunebu/imgs/raw/main/wallpapers/nixos-rose-pine.png";
        sha256 = "084qgbicqiqwprb9m6l5jwij26rv8r73h76vba523z6q9rz0snlw";
      };
      base16Scheme = fromYAML "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
      cursor = {
        package = pkgs.rose-pine-cursor;
        name = "BreezeX-RosePineDawn-Linux";
        size = 32;
      };

      icon.package = pkgs.rose-pine-icon-theme;

      fonts = {
        serif = {
          package = pkgs.ibm-plex;
          name = "IBM Plex Serif";
        };

        sansSerif = {
          package = pkgs.ibm-plex;
          name = "IBM Plex Sans";
        };

        monospace = {
          package = pkgs.ibm-plex;
          name = "IBM Plex Mono";
        };

        emoji = {
          package = pkgs.noto-fonts-monochrome-emoji;
          name = "Noto Emoji";
        };
      };
    };
  };
}
