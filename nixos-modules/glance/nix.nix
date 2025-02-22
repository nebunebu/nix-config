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
        {
          type = "reddit";
          subreddit = "NixOS";
          show-thumbnails = true;
          sort-by = "top";
          top-period = "day";
        }
        {
          type = "repository";
          repository = "NixOS/nixpkgs";
          issues-limit = 3;
          commits-limit = 3;
        }
        {
          type = "repository";
          repository = "nix-community/home-manager";
          issues-limit = 3;
          commits-limit = 3;
        }
        {
          type = "repository";
          repository = "danth/stylix";
          issues-limit = 3;
          commits-limit = 3;
        }
        {
          type = "repository";
          repository = "nix-community/nixvim";
          issues-limit = 3;
          commits-limit = 3;
        }
      ];
    }
  ];
}
