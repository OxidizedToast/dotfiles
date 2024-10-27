function ColorMyPencils(color) 
  vim.opt.termguicolors = true
  color = color or "dracula"
  vim.cmd.colorscheme(color)

  -- Makes background transparent 
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  -- Set transparency for number lines
  vim.api.nvim_command("highlight LineNr guibg=none")
  vim.api.nvim_command("highlight SignColumn guibg=none")

end

ColorMyPencils()
