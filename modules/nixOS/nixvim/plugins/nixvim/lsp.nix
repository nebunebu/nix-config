{
  programs.nixvim.plugins = {
    lspkind = {
      enable = true;
      cmp.enable = true;
      mode = "symbol_text";
    };
    lsp = {
      enable = true;
      keymaps = {
        diagnostic = {
          "<leader>j" = "goto_next";
          "<leader>k" = "goto_prev";
        };
        lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
      };
      servers = {
        bashls.enable = true;
        ccls.enable = true;
        cmake.enable = true;
        cssls.enable = true;
        hls.enable = true;
        html.enable = true;
        jsonls.enable = true;
        lua-ls.enable = true;
        nil_ls.enable = true;
        pyright.enable = true;
        taplo.enable = true;
        tsserver.enable = true;
        yamlls.enable = true;
      };
    };
  };

  programs.nixvim.extraConfigLua = ''
    -- You will likely want to reduce updatetime which affects CursorHold
    -- note: this setting is global and should be set only once
    vim.o.updatetime = 250
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
      callback = function ()
        vim.diagnostic.open_float(nil, {focus=false})
      end
    })

  '';
}
