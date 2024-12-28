return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
      },
      tabline = {
        lualine_a = { { "buffers", show_filename_only = false } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "tabs" },
        lualine_z = { { "datetime", style = "default" } },
      },
      sections = {
        lualine_a = { {
          "mode",
          fmt = function(str)
            return str:sub(1, 6)
          end,
        } },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 3 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
