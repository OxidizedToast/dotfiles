vim.cmd[[ set guifont=Symbols\ devicons\ Font\ 12 ]]

require('lualine').setup {
  options = { theme = 'gruvbox_dark', icons_enabled = true },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'},
  }
}

