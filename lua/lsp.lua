-- Nicholas J Uhlhorn
-- November 2025

local on_attach = function(client, bufnr)
    if client.name == "lua_ls" then
        client.server_capabilities.documentFormattingProvider = false
    end

    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormatting", {}),
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({async = false})
            end
        })
    end

    local capabilities = vim.lsp.protocol.get_client_capabilities()
    local cmp_nvim_lsp = require('cmp_nvim_lsp')
    if cmp_nvim_lsp then
        capabilities = cmp_nvim_lsp.default_capabilites(capabilities)
    end

    vim.lsp.config('*', {
        on_attach = on_attach,
        capabilities = capabilities,
    })


    vim.lsp.config('pyright', {
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = 'basic',
                },
            },
        },
    })

    vim.lsp.config('rust-analyzer', {
        settings = {
            ["rust-analyzer"] = {
                check = {
                    command = 'clippy'
                },
            },
        },
    })

    vim.lsp.config('lua_ls', {
        settings = {
            Lua = {
                runtime = {version = "LuaJIT"},
                diagnostics = {
                    globals = {'vim'},
                },
                telementry = {enable = false}
            }
        }
    })

    local servers_to_enable = {
        -- Core Languages
        "clangd",         -- C/C++
        "rust_analyzer",  -- Rust (Configured above)
        "pyright",        -- Python (Configured above)
        "lua_ls",         -- Lua (Configured above)

        -- Web Development
        "html",           -- HTML
        "cssls",          -- CSS
        "tsserver",       -- JavaScript/TypeScript
    }

    for _, server in ipairs(servers_to_enable) do
       vim.lsp.enable(server) 
    end
