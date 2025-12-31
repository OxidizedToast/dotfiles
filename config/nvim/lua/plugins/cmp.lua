return {
  -- nvim-cmp engine
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- load on entering insert mode
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",       -- LSP source
      "hrsh7th/cmp-buffer",         -- buffer words
      "hrsh7th/cmp-path",           -- file paths
      "hrsh7th/cmp-cmdline",        -- command-line
      "L3MON4D3/LuaSnip",           -- snippet engine
      "saadparwaiz1/cmp_luasnip",   -- snippet completions
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      })

      -- Use buffer source for `/` in command-line
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" }
        }
      })

      -- Use cmdline & path source for ':'
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" }
        }, {
          { name = "cmdline" }
        })
      })
    end,
  },
}
