{
  name = "Repos";
  hide-desktop-navigation = false;
  center-vertically = true;
  columns = [
    {
      size = "full";
      widgets = [
        {
          type = "releases";
          show-source-icon = true;
          repositories = [
            "jellyfin/jellyfin"
            "glanceapp/glance"
            "hyprwm/Hyprland"
            "DreamMaoMao/mangowc"
            "TibixDev/winboat"
            "rasmus-kirk/nixarr"
          ];
        }
        {
          type = "repository";
          repository = "glanceapp/glance";
          issues-limit = 3;
          commits-limit = 3;
        }
        {
          type = "repository";
          repository = "AvengeMedia/danklinux";
          issues-limit = 3;
          commits-limit = 3;
        }
        {
          type = "repository";
          repository = "AvengeMedia/DankMaterialShell";
          issues-limit = 3;
          commits-limit = 3;
        }
        {
          type = "repository";
          repository = "AvengeMedia/dms-plugins";
          issues-limit = 3;
          commits-limit = 3;
        }
        {
          type = "repository";
          repository = "AvengeMedia/dms-plugin-registry";
          issues-limit = 3;
          commits-limit = 3;
        }
        {
          type = "repository";
          repository = "DreamMaoMao/mangowc";
          issues-limit = 3;
          commits-limit = 3;
        }
        {
          type = "repository";
          repository = "devmobasa/wayscriber";
          issues-limit = 3;
          commits-limit = 3;
        }
      ];
    }
  ];
}
