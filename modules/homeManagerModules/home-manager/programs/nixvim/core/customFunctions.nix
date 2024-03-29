{
  programs.nixvim.extraConfigLua = ''
    vim.api.nvim_create_autocmd({'UIEnter'}, {
      callback = function(event)
        local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
        if client ~= nil and client.name == "Firenvim" then
          if vim.o.lines < 4 then
            vim.o.lines = 4
          end
          if vim.o.columns < 80 then
            vim.o.columns = 80
          end
        end
      end
    })
  '';
}
