return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  ensure_unstalled = {"c", "lua", "python", "cpp", "bash", "rust", "yaml", "toml", "json"},
  highlight = {
	enable = true,
	additional_vim_regex_highlighting = false
  }
}
