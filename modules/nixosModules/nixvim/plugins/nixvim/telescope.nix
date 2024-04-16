{
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions = {
      project-nvim.enable = true;
      fzf-native = {
        enable = true;
        caseMode = "smart_case";
        fuzzy = true;
        overrideFileSorter = true;
        overrideGenericSorter = true;
      };
    };
  };
}
