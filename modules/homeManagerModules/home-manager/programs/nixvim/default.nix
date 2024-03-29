{ inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./core/globals.nix
    ./core/options.nix
    # ./core/autoGroups
    #   ./core/autoCmd.nix
    #   ./core/customFunctions.nix
    #   ./core/userCommands.nix
    #   ./core/filetype.nim
    ./core/highlight.nix
    ./plugins/default.nix
  ];

  programs.nixvim = {
    enable = true;
    enableMan = true;
    clipboard.providers.wl-copy.enable = true;
  };
}
