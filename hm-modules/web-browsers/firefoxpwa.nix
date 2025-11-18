{
  lib,
  pkgs,
  config,
  ...
}:

let
  cfg = config.hm.web-browsers.firefoxpwa;
in
{
  options.hm.web-browsers.firefoxpwa = {
    enable = lib.mkEnableOption "enable firefoxpwa";
  };

  config = lib.mkIf cfg.enable {
    programs.firefoxpwa = {
      enable = true;
      profiles = {
        # `nix run nixpkgs#ulid`
        "01K9R0QNJ5FMK7PBPYN5Y331QV" = {
          name = "Default";
          sites = {
            # `nix run nixpkgs#ulid`
            "01K9R0ZKNWAWX0YRKKPC8Q5849" = {
              name = "Monkey Type";
              url = "https://monkeytype.com/";
              manifestUrl = "https://monkeytype.com/mainfest.json";
              desktopEntry.icon = pkgs.fetchurl {
                url = "https://monkeytype.com/images/icons/general_icon_x512.png";
                sha256 = "sha256-5N7+WLS2o5ISVaiCScAfn3K44linz2YTQpWzP8L0Dl4=";
              };
              # https://kairu.app/
            };
          };
        };
      };
    };
  };
}
