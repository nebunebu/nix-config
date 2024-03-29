{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [
      { plugin = pkgs.triptych-nvim; }
      { plugin = pkgs.vimPlugins.marks-nvim; }
      # {plugin = pkgs.telescope-vim-bookmarks-nvim;}
      # {plugin = pkgs.vimPlugins.firenvim;}
      {
        plugin = pkgs.vimPlugins.rose-pine;
        config = "colorscheme rose-pine";
      }
    ];
    extraConfigLua = ''
      require("triptych").setup({})
      require("marks").setup({})
    '';
  };
}
