{
  imports = [
    ./telescope.nix
    ./lualine.nix
    ./alpha.nix
    ./treesitter.nix
    ./undotree.nix
    ./which-key.nix
    ./lsp.nix
    ./cmp.nix
    ./none-ls.nix
    ./mkdnflow.nix
    ./luasnip.nix
  ];

  programs.nixvim.plugins = {
    navic.enable = true;
    project-nvim.enable = true;
    nix.enable = true;
    oil.enable = true;
    indent-blankline.enable = true;
    indent-blankline.scope.enabled = true;
    rainbow-delimiters.enable = true;
    nvim-autopairs.enable = true;
    endwise.enable = true;
    fidget.enable = true;
    nix-develop.enable = true;
    tmux-navigator.enable = true;
    comment-nvim.enable = true;
    barbecue.enable = true;
    surround.enable = true;
    todo-comments.enable = true;
    navbuddy.enable = true;
    nvim-colorizer.enable = true;
  };
}
