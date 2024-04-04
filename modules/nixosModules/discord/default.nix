{ options
, config
, lib
, pkgs
, ...
}:

{
  options = {
    discord.enable = lib.mkEnableOption "enable discord";
  };


  config = lib.mkIf config.desktop.hyprland.enable {
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = [
      (pkgs.discord.override {
        withOpenASAR = true;
      })
      pkgs.xwaylandvideobridge
    ];

    # home.persist.directories = [
    #   ".config/discord"
    # ];
  };
}
