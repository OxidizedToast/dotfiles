local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup()
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {
	  'tsserver', 'jdtls', 'clangd', 'bashls', 'cssls',
	  'html', 'jsonls', 'intelephense', 'lua_ls',
	  'rust_analyzer', 'pkgbuild_language_server', 'cmake', 'vimls',},
  handlers = {
    lsp_zero.default_setup,
  }
})
