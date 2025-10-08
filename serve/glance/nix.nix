{
  name = "Nix";
  hide-desktop-navigation = false;
  center-vertically = true;
  columns = [
    {
      size = "full";
      widgets = [
        {
          type = "repository";
          repository = "NixOS/nixpkgs";
          issues-limit = 5;
          commits-limit = 5;
          pull-requests-limit = 5;
        }
        {
          type = "repository";
          repository = "nix-community/home-manager";
          issues-limit = 5;
          commits-limit = 5;
          pull-requests-limit = 5;
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
        {
          type = "reddit";
          subreddit = "NixOS";
          show-thumbnails = true;
          sort-by = "hot";
          limit = 10;
        }
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
