{ config, lib, pkgs, ... }:

{
  options = {
    app.discord.enable = lib.mkEnableOption "enable discord";
  };


  config = lib.mkIf config.app.discord.enable {
    # nixpkgs.config.allowUnfree = true;

    # nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    #   "discord"
    # ];
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
