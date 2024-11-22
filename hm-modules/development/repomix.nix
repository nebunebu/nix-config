{ lib, pkgs, config, ... }:
let
  cfg = config.neb.development.repomix;
in
{
  options.neb.development.repomix = {
    enable = lib.mkEnableOption "enable repomix";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      (pkgs.callPackage ../../pkgs/repomix.nix { })
    ];

    xdg.configFile."repopack/repopack.config.json".text = builtins.toJSON {
      output = {
        style = "xml";
        removeComments = false;
        removeEmptyLines = false;
        topFilesLength = 3;
        showLineNumbers = true;
        # headerText = '''';
      };
      include = [ ];
      ignore = {
        useGitignore = true;
        useDefaultPatterns = true;
        customPatterns = [ "**/full-yt/xmls/*" ];
      };
    };

    home.shellAliases.repopack =
      "repopack -o ${config.home.homeDirectory}/Documents/repopacks/$(basename $(pwd) | sed 's/^\\./').xml";
  };
}
