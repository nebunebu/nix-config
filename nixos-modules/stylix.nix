{ lib
, config
, pkgs
, unstablePkgs
, ...
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

    fonts.packages = [
      unstablePkgs.ibm-plex
      unstablePkgs.nerd-fonts.im-writing
      unstablePkgs.nerd-fonts.blex-mono
      # unstablePkgs.nerd-fonts.symbols-only
    ];

    stylix = {
      enable = true;
      image = builtins.fetchurl {
        url = "https://github.com/nebunebu/imgs/raw/main/wallpapers/liminal-tv.jpg";
        sha256 = "1mvvmc5nj45apbiqlia02vnnmmjpzb88v921zl2pjddkzsdhzi3s";
      };
      base16Scheme = fromYAML "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
      cursor = {
        package = pkgs.rose-pine-cursor;
        name = "BreezeX-RosePineDawn-Linux";
      };


      fonts = {
        serif = {
          package = unstablePkgs.ibm-plex;
          name = "IBM Plex Serif";
        };

        sansSerif = {
          package = unstablePkgs.ibm-plex;
          name = "IBM Plex Sans";
        };

        monospace = {
          package = unstablePkgs.ibm-plex;
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
