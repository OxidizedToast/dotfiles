return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls", "clangd", "pyright", "lua_ls", "rust_analyzer",
          "jsonls", "yamlls", "taplo", "marksman"
        },
      })
    end,
  },
}
