-- Load Lazy.nvim and plugins
require("config.lazy")

-- Load keymaps / remaps
require("config.remap")

-- Basic Neovim options
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.termguicolors = true
