local lsp_zero = require("lsp-zero")

-- Attach keymaps
local on_attach = function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end

-- Capabilities for nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "pyright",
        "lua_ls",
        "rust_analyzer",
        "clangd",
        "bashls",
    },

    handlers = {
        -- Default handler
        function(server)
            vim.lsp.config(server, {
                on_attach = on_attach,
                capabilities = capabilities,
            })
            vim.lsp.enable(server)
        end,

        -- Custom server example: lua_ls
        lua_ls = function()
            vim.lsp.config("lua_ls", {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })
            vim.lsp.enable("lua_ls")
        end,
    },
})

