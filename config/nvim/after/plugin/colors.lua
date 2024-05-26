function ColorMyPencils(color) 
  vim.opt.termguicolors = true
  color = color or "kanagawa-wave"
  vim.cmd.colorscheme(color)

-- Uncomment to make background transparent 

--
--	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
