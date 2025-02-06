{
  lib,
  pkgs,
  config,
  ...
}:
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

    xdg.configFile."repomix/repomix.config.json".text = builtins.toJSON {
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

    home.shellAliases.repomix = "repomix -o '${config.home.homeDirectory}/Documents/repomixes/'\"$(basename \"$PWD\" | sed 's/^\\.//')\".xml";
  };
}
