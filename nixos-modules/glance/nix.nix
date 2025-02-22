{
  name = "Nix";
  hide-desktop-navigation = false;
  center-vertically = true;
  columns = [
    # {
    #   size = "small";
    #   widgets = [
    #     {
    #       type = "releases";
    #       show-source-icon = true;
    #       repositories = [
    #         "jellyfin/jellyfin"
    #         "glanceapp/glance"
    #       ];
    #     }
    #   ];
    # }
    {
      size = "full";
      widgets = [
        {
          type = "lobsters";
          subreddit = "hot";
          tags = [
            "nix"
            "linux"
          ];
        }
      ];
    }
  ];
}
