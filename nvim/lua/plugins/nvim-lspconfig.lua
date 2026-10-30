return {
    {
        "neovim/nvim-lspconfig",
        -- Load LSP engine as soon as you open a code buffer
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            -- 1. Setup Global Keymaps (Fires when any LSP connects to a buffer)
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    -- Your standard IDE shortcuts
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)       -- Documentation popup
                end,
            })

            -- 2. Configure individual servers using the modern Neovim API
            -- Silences the annoying "Undefined global 'vim'" warning in your config files
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                    },
                },
            })

            -- Rust analyzer config
            vim.lsp.config("rust_analyzer", {
                settings = {
                    ["rust-analyzer"] = {
                        inlayHints = {
                            bindingModeHints = { enable = true },
                            parameterHints = { enable = true },
                            typeHints = { enable = true },
                        },
                    },
                },
            })

            -- jdtls config
            vim.lsp.config("jdtls", {
                settings = {
                    java = {
                        inlayHints = {
                            parameterNames   = {
                                enabled = "all",
                            },
                            variableTypes    = {
                                enabled = true,
                            },
                            parameterTypes   = {
                                enabled = true,
                            },
                            formatParameters = {
                                enabled = true,
                            },
                        },
                        implementationsCodelens = {
                            enabled = true,
                        },
                        referencesCodeLens = {
                            enabled = true,
                        },
                        signatureHelp = {
                            enabled = true,
                        },
                    },
                },
            })
            -- 3. Turn on the servers (Must be installed on your NixOS machine via systemPackages!)
            vim.lsp.config("pyrefly", {
                settings = {
                    python = {
                        analysis = {
                            inlayHints = {
                                callArgumentNames = "all",
                                functionReturnTypes = true,
                                variableTypes = true,
                            },
                        },
                    },
                },
            })
            vim.lsp.enable({
                "lua_ls",
                "nil",
                "rust_analyzer",
                "pyrefly",
                "jdtls",
                "marksman",
            })
        end,

    }
}
