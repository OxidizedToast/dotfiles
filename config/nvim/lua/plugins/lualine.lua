return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",  -- lazy-load when Neovim is idle
    config = function()
      require("lualine").setup({
        options = {
          theme = "gruvbox_dark",  -- use gruvbox dark theme
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,  -- make statusline global (Neovim 0.8+)
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      })
    end,
  },
}
