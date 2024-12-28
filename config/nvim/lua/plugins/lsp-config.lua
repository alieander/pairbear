return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "marksman", "rubocop" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspc = require("lspconfig")
      lspc.lua_ls.setup({
        capabilities = capabilities,
      })
      lspc.pyright.setup({
        capabilities = capabilities,
      })
      lspc.marksman.setup({
        capabilities = capabilities,
      })
      lspc.rubocop.setup({
        capabilities = capabilities,
      })

      vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

      -- Hover border setup
      local _border = "double"
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = _border,
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = _border,
      })

      vim.diagnostic.config({
        float = { border = _border },
      })

      require("lspconfig.ui.windows").default_options = {
        border = _border,
      }
    end,
  },
}
