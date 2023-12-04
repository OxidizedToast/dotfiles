vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- custom I made

-- Ok I got chat gpt to help make this but I techically made this one
vim.keymap.set("n", "<leader>ws", ":vsplit<CR>:wincmd w<CR>:Ex<CR>", { noremap = true, silent = true })

