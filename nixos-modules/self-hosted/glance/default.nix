{
  lib,
  config,
  ...
}:
let
  cfg = config.nos.self-hosted.glance;
in
{
  options.nos.self-hosted.glance = {
    enable = lib.mkEnableOption "enable glance";
  };

  config = lib.mkIf cfg.enable {
    # Themed by hand below; stylix's target would fight the settings here.
    stylix.targets.glance.enable = false;

    services.glance = {
      enable = true;
      openFirewall = true;
      settings = {
        server = {
          host = "0.0.0.0";
          port = 3000;
        };
        theme = {
          background-color = "249 22 12";
          primary-color = "267 57 78";
          positive-color = "197 49 38";
          negative-color = "343 76 68";
          contrast-multiplier = 1.2;
        };
        branding = {
          hide-footer = true;
        };
        pages = [
          (import ./startpage.nix)
          (import ./repos.nix)
          (import ./nix.nix)
          (import ./feeds.nix)
          (import ./links.nix)
        ];
      };
    };
  };
}
