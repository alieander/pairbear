return {
  { "mason-org/mason.nvim", version="^1.0.0" },
  {
    "mason-org/mason-lspconfig.nvim",
    version="^1.0.0",
    -- dependencies = { "mason-org/mason.nvim" },
    -- config = function()
    --   require("mason-lspconfig").setup({
    --     ensure_installed = { "lua_ls", "tsserver" },
    --     automatic_installation = true,
    --   })
    -- end,
  },
}
