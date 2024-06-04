{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  systemd.tmpfiles.settings."jellyfin" = {
    "/srv/jellyfin/Movies/" = {
      d = {
        group = "jellyfin";
        mode = "770";
        user = "jellyfin";
        age = "-";
      };
    };
    "/srv/jellyfin/Music/" = {
      d = {
        group = "jellyfin";
        mode = "770";
        user = "jellyfin";
        age = "-";
      };
    };
    "/srv/jellyfin/Shows/" = {
      d = {
        group = "jellyfin";
        mode = "770";
        user = "jellyfin";
        age = "-";
      };
    };
    "/srv/jellyfin/Courses/" = {
      d = {
        group = "jellyfin";
        mode = "770";
        user = "jellyfin";
        age = "-";
      };
    };
    "/srv/jellyfin/Other/" = {
      d = {
        group = "jellyfin";
        mode = "770";
        user = "jellyfin";
        age = "-";
      };
    };
  };
}
