{ inputs, ... }: {
  imports = [
    inputs.nixvim.nixosModules.nixvim
    #   ./core/customFunctions.nix
    #   ./core/filetype.nim
    #   ./core/userCommands.nix
    # ./core/autoGroups
    ./core/autoCmd.nix
    ./core/globals.nix
    ./core/highlight.nix
    ./core/options.nix
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
