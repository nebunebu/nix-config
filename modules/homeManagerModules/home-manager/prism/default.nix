{ inputs, config, ... }:

{
  imports = [
    inputs.prism.homeModules.prism
  ];

  # wDir = "${config.home.homeDirectory}/.nix-config/home-manager/common/gui/theme/wallpapers";
  # colorScheme = inputs.nix-colors.colorSchemes.rose-pine;

  prism = {
    enable = true;
    colorscheme = inputs.nix-colors.colorSchemes.rose-pine;
    wallpapers = ./wallpapers; # Path to the wallpapers directory in your config. (IMAGES ONLY)
    outPath = "${config.xdg.configHome}/wallpapers"; # Where in your home directory to output to.
  };
}
