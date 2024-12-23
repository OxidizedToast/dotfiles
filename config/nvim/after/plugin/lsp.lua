local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup()
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {
	  'gopls',
    'kotlin_language_server',
    'pyright',
	  'lua_ls',
    'clangd',
    'bashls',
	   },
  handlers = {
    lsp_zero.default_setup,
  }
})

