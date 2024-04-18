{
  programs.nixvim = {
    plugins = {
      nvim-cmp = {
        enable = true;
        snippet.expand = "luasnip";
        autoEnableSources = true;
        sources = [
          { name = "cmp_nvim_lsp"; }
          { name = "nvim_lsp"; }
          { name = "nvim_lsp_signature_help"; }
          { name = "luasnip"; }
          { name = "path"; }
          # {name = "buffer";}
          { name = "cmp_luasnip"; }
        ];
        window = {
          completion.border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
          documentation.border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
        };
        mapping = {
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
          "<Tab>" = {
            modes = [ "i" "s" ];
            action = "cmp.mapping.select_next_item()";
          };
          "<S-Tab>" = {
            modes = [ "i" "s" ];
            action = "cmp.mapping.select_prev_item()";
          };
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };
      };
    };
  };
}
