{ inputs
, lib
, pkgs
, config
, ...
}:
let
  cfg = config.neb.desktop.utilities.anyrun;
in
{
  imports = [
    inputs.anyrun.homeManagerModules.default
  ];

  options.neb.desktop.utilities.anyrun = {
    enable = lib.mkEnableOption "enable anyrun";
  };

  config = lib.mkIf cfg.enable {

    programs.anyrun = {
      enable = true;
      config = {
        x = { fraction = 0.5; };
        y = { fraction = 0.3; };
        width = { fraction = 0.3; };
        height = { fraction = 0.3; };
        hideIcons = false;
        ignoreExclusiveZones = false;
        layer = "top";
        hidePluginInfo = false;
        closeOnClick = false;
        showResultsImmediately = false;
        maxEntries = null;

        plugins = [
          inputs.anyrun.packages.${pkgs.system}.applications
          inputs.anyrun.packages.${pkgs.system}.dictionary
          inputs.anyrun.packages.${pkgs.system}.shell
          inputs.anyrun.packages.${pkgs.system}.symbols
          inputs.anyrun.packages.${pkgs.system}.translate
          inputs.anyrun.packages.${pkgs.system}.websearch
        ];
      };

      # Inline comments are supported for language injection into
      # multi-line strings with Treesitter! (Depends on your editor)
      extraCss = /*css */ ''
        .some_class {
          background: red;
        }
      '';

      extraConfigFiles."some-plugin.ron".text = ''
        Config(
          // for any other plugin
          // this file will be put in ~/.config/anyrun/some-plugin.ron
          // refer to docs of xdg.configFile for available options
        )
      '';
    };
  };
}
