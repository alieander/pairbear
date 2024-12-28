return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    local hooks = require("ibl.hooks")
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#dc322f" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#b58900" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#268bd2" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#cb4b16" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#859900" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#6c71c4" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#2aa198" })
    end)

    require("ibl").setup({
      indent = { highlight = highlight, char = "│", tab_char = "▕", smart_indent_cap = true },
    })
  end,
}
