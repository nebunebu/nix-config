{ pkgs, config, ... }:

{
  home.packages = [
    (pkgs.callPackage ../../pkgs/repopack.nix { })
  ];

  xdg.configFile."repopack/repopack.config.json".text = builtins.toJSON {
    output = {
      filePath = "${config.home.homeDirectory}/Documents/repopacks/repopack-repopack-output.txt";
      style = "xml";
      removeComments = false;
      removeEmptyLines = false;
      topFilesLength = 3;
      showLineNumbers = true;
    };
    include = [ ];
    ignore = {
      useGitignore = true;
      useDefaultPatterns = true;
      customPatterns = [ "**/full-yt/xmls/*" ];
    };
  };

  home.shellAliases.repopack =
    "repopack -o ${config.home.homeDirectory}/Documents/repopacks/repopack-$(basename $(pwd)).txt";
}
