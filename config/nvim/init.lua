-- Load Lazy.nvim and plugins
require("config.lazy")

-- Load keymaps / remaps
require("config.remap")

-- Basic Neovim options
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.termguicolors = true

-- tab indentation
vim.opt.tabstop = 4        -- how many spaces a tab looks like
vim.opt.shiftwidth = 4     -- how many spaces auto-indent uses
vim.opt.softtabstop = 4    -- how many spaces <Tab> inserts in insert mode
vim.opt.expandtab = true   -- convert tabs to spaces


