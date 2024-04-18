-- Nicholas J Uhlhorn
-- April 2024

return {
    {'rust-lang/rust.vim'},
    {
        'simrat39/rust-tools.nvim',
        config = function()
            require('rust-tools').setup({
                server = {
                    on_attach = require'cmp'.on_attach,
                    settings = {
                        ['rust-analyzer'] = {
                            assist = {
                                importMergeBehavoir = 'last',
                                importPrefix = 'by_self',
                            },
                            cargo = {
                                loadOutDirsFromCheck = true,
                            },
                            procMacro = {
                                enable = true,
                            },
                        }
                    }
                },
                tools = {
                    executor = require('rust-tools.executors').termopen,
                    autoSetHints = true,
                    runnables = {
                        use_telescope = true,
                    },
                    inlay_hints = {
                        auto = true,
                        show_parameter_hints = true,
                        parameter_hints_prefix = '<-',
                        other_hints_prefix = '=>',
                    },
                    reload_workspace_from_cargo_toml = true,
                },
            })

        end
    },
    {
        'saecki/crates.nvim',
        config = function()
            require('crates').setup({})
        end
    },
}

