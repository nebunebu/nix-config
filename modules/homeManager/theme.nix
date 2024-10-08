{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    app.theme.enable = lib.mkEnableOption "enable theme";
  };

  config = lib.mkIf config.app.theme.enable {
    home.pointerCursor = {
      gtk.enable = true;
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
    };
    gtk = {
      enable = true;
      theme = {
        package = pkgs.rose-pine-gtk-theme;
        name = "rose-pine";
      };
      iconTheme = {
        package = pkgs.rose-pine-icon-theme;
        name = "rose-pine";
      };
      font = {
        name = "DroidSansM Nerd Font";
      };
    };
    qt = {
      enable = true;
      platformTheme = "gtk3";
    };
  };
}
