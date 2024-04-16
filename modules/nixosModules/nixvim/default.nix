{ inputs, ... }: {
  imports = [
    inputs.nixvim.nixosModules.nixvim
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

  environment.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.nixvim = {
    enable = true;
    enableMan = true;
    clipboard.providers.wl-copy.enable = true;
  };
}