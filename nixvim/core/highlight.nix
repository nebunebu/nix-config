{
  # autopairs and indent colors
  programs.nixvim.extraConfigLua = ''
    -- luacheck: globals vim
    local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
    }

    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#EB6F92" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#F6C177" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#9CCFD8" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#EBBCBA" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#9CCFD8" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C4A7E7" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#E0DEF4" })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    require("ibl").setup({
      indent = {
        highlight = highlight,
        -- char = "▏",
        char = "·"
      },
      scope = {
        highlight = highlight,
        -- char = "▏"
        char = "·"
      }
    })
  '';
}
