return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function()
    require("oil").setup({
      -- columns = { "icons" },
      keymaps = {},
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, _)
          return name == ".."
        end,
      },
    })

    -- Open parent dir in current window
    vim.keymap.set("n", "-", "<CMD>Oil<CR>")

    -- Open parent dir in floating window
    vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
  end,
}
