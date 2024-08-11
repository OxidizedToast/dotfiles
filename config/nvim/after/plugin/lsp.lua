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
    'perlnavigator',
    'kotlin_language_server',
    'tsserver',
    'jdtls',
    'rust_analyzer',
    'pyright',
	  'lua_ls',
    'clangd',
    'bashls',
    'zls',
	   },
  handlers = {
    lsp_zero.default_setup,
  }
})

