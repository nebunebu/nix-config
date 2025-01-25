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
        hideIcons = false;
        ignoreExclusiveZones = false;
        layer = "overlay";
        hidePluginInfo = false;
        closeOnClick = false;
        showResultsImmediately = false;
        maxEntries = null;

        plugins = [
          # An array of all the plugins you want, which either can be paths to the .so files, or their packages
          # inputs.anyrun.packages.${pkgs.system}.applications
          # ./some_plugin.so
          # "${inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins}/lib/kidex"
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
