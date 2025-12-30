{
  name = "Feeds";
  hide-desktop-navigation = false;
  center-vertically = true;
  columns = [
    {
      size = "full";
      widgets = [
        {
          type = "reddit";
          subreddit = "unixporn";
          style = "horizontal-cards";
          show-thumbnails = true;
          sort-by = "top";
          top-period = "day";
        }
        {
          type = "releases";
          show-source-icon = true;
          repositories = [
            "jellyfin/jellyfin"
            "glanceapp/glance"
            "hyprwm/Hyprland"
          ];
        }
        {
          type = "repository";
          repository = "glanceapp/glance";
          issues-limit = 3;
          commits-limit = 3;
        }
      ];
    }
  ];
}
