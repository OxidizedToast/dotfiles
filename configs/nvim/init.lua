--Plugins




-- Set tab width to 4 spaces
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Turn off mouse & Arrow Keys
vim.o.mouse = ''
-- Arrow Keys
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Only effects normal mode
-- to add copy and paste and 
-- make n V or I
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

-- Bar at the bottom of the screen
vim.o.statusline = "Neovim: %{expand('%:p')} %< %=%{&filetype} %h%r%w%q"

-- Color schemes

-- Bar at bottom of screen 
vim.cmd('highlight Statusline ctermbg=lightgray ctermfg=red')

-- Number lines
vim.cmd('highlight LineNr ctermfg=darkred')


