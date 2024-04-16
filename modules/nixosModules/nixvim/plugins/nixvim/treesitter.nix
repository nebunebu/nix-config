{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    ensureInstalled = "all";
    indent = true;
    nixvimInjections = true;
    incrementalSelection.enable = true;
  };
}
