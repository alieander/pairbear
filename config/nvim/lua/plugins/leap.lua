return {
  "ggandor/leap.nvim",
  config = function()
    require("leap").create_default_mappings()

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        if vim.g.colors_name == "solarized-osaka" then
          vim.api.nvim_set_hl(0, "LeapLabel", { bg = "yellow" })
        end
      end,
    })
  end,
}
