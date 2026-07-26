{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.nos.stylix;
in
{
  options.nos.stylix = {
    enable = lib.mkEnableOption "enable stylix";
  };

  # Stylix only auto-imports its home-manager half when `stylix.enable` is
  # true, so with the toggle off every `stylix.targets.*` reference in
  # hm-modules/ would be an "option does not exist" error. Import the module
  # (and only the module -- it activates nothing on its own) in that case, so
  # `nos.stylix.enable = false` is a real toggle rather than an eval failure.
  config = lib.mkMerge [
    (lib.mkIf (!cfg.enable) {
      home-manager.sharedModules = [ config.stylix.homeManagerIntegration.module ];
    })

    (lib.mkIf cfg.enable {
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
        # A YAML path directly, not parsed at eval time: the old fromYAML helper
        # was import-from-derivation, which forced a yj build before *any* eval
        # of a stylix host could proceed.
        base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
        cursor = {
          package = pkgs.rose-pine-cursor;
          name = "BreezeX-RosePineDawn-Linux";
          size = 32;
        };

        # icon.package = pkgs.rose-pine-icon-theme;

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
    })
  ];
}
