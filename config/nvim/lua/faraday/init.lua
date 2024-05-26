--Adds files (remap)
require("faraday.remap")

-- Tabbing
-- Enable true tab behavior
vim.o.tabstop = 2       -- Number of visual spaces per tab
vim.o.softtabstop = 2   -- Number of spaces for a tab when editing
vim.o.shiftwidth = 2    -- Number of spaces to use for each step of (auto)indent
vim.o.expandtab = true  -- Use spaces instead of tabs

-- Enable tab key to insert spaces instead of tab characters
vim.o.smarttab = true

-- Turn off mouse & Arrow Keys
vim.o.mouse = ''
-- Arrow Keys
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<Up>', '<NOP>', opts)
map('n', '<Down>', '<NOP>', opts)
map('n', '<Left>', '<NOP>', opts)
map('n', '<Right>', '<NOP>', opts)

-- Font
vim.o.guifont = 'JetBrainsMono:h12'

-- Basic Settings
vim.o.number = true
vim.o.relativenumber = true
vim.cmd('syntax on')
