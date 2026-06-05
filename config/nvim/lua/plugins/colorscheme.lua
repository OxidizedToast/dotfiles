return {
  {
    "AlphaTechnolog/pywal.nvim",
    config = function()
      require("pywal").setup({
        transparent = true,  -- simple transparent background
      })
      vim.cmd.colorscheme("pywal")

      -- make highlights transparent
      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
    end,
  },
}
