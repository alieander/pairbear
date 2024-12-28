return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,

        -- Javascript
        null_ls.builtins.formatting.prettier,

        -- Ruby
        -- null_ls.builtins.formatting.rubocop.with({
        --   command = "/home/vagrant/.dotfiles/bin/bundle-hack",
        --   args = vim.list_extend({ "exec", "rubocop" }, null_ls.builtins.formatting.rubocop._opts.args),
        -- }),
        null_ls.builtins.diagnostics.rubocop.with({
          command = "/home/vagrant/.dotfiles/bin/bundle-hack",
          args = vim.list_extend({ "exec", "rubocop" }, null_ls.builtins.diagnostics.rubocop._opts.args),
        }),

        -- Python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.mypy,

        -- Other
        -- null_ls.builtins.completion.spell,
      },
    })

    vim.keymap.set("n", "<leader>af", function()
      vim.lsp.buf.format({ timeout_ms = 5000 })
    end)
  end,
}
