{
  programs.beets = {
    enable = true;
    # mpdIntegrations = {};
    settings = {
      directory = "/srv/music";
      plugins = [
        "discogs"
        "duplicates"
        # "extrafiles"
        "permissions"
      ];
      permissions = {
        file = "666";
        dir = "777";
      };
      threaded = "yes";
      ui = {
        color = "yes";
      };
    };
  };
}
