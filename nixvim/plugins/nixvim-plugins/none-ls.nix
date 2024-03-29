{
  programs.nixvim.plugins.lsp-format.enable = true;
  programs.nixvim.plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    sources = {
      code_actions = {
        eslint.enable = true;
        gitsigns.enable = true;
        shellcheck.enable = true;
        statix.enable = true;
      };
      diagnostics = {
        cppcheck.enable = true;
        deadnix.enable = true;
        eslint.enable = true;
        luacheck = {
          enable = true;
        };
        pylint.enable = true;
        shellcheck.enable = true;
      };
      formatting = {
        nixpkgs_fmt.enable = true;
        beautysh.enable = true;
        fourmolu.enable = true;
        jq.enable = true;
        prettier.enable = true;
        stylua.enable = true;
      };
    };
  };
}
