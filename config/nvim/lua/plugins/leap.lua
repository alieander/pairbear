return {
   url = "https://codeberg.org/andyg/leap.nvim",
  config = function()
    vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
    vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')

    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function ()
        if vim.g.colors_name == "solarized-osaka" then
          vim.api.nvim_set_hl(0, 'LeapLabel', { bg = "yellow" })
        end
      end
    })
end
}
