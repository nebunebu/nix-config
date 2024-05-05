{
  imports = [
    ./alpha.nix
    ./cmp.nix
    ./floaterm.nix
    ./lsp.nix
    ./lualine.nix
    ./luasnip.nix
    ./mkdnflow.nix
    ./none-ls.nix
    ./telescope.nix
    ./treesitter.nix
    ./undotree.nix
    ./which-key.nix
  ];

  programs.nixvim.plugins = {
    barbecue.enable = true;
    comment-nvim.enable = true;
    endwise.enable = true;
    fidget.enable = true;
    indent-blankline.enable = true;
    indent-blankline.scope.enabled = true;
    navbuddy.enable = true;
    navic.enable = true;
    nix-develop.enable = true;
    nix.enable = true;
    nvim-autopairs.enable = true;
    nvim-colorizer.enable = true;
    oil.enable = true;
    project-nvim.enable = true;
    rainbow-delimiters.enable = true;
    surround.enable = true;
    tmux-navigator.enable = true;
    todo-comments.enable = true;
  };
}
