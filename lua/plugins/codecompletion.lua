return {
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
            'onsails/lspkind.nvim'
        },
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')
            local lspkind = require('lspkind')

            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                completion = {
                    completeopt = 'menu,menuone,preview,noselect',
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({select = false}),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                }),
                formatting = {
                    format = lspkind.cmp_format({
                        maxwidth = 50,
                        ellipis_char = '...',
                    }),
                },
            })
        end
    },
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
    {'hrsh7th/cmp-cmdline'},
    {
        'mfussenegger/nvim-lint',
        event = {
            "BufReadPre",
            "BufNewFile"
        },
        config = function()
            local lint = require('lint')
            lint.linters_by_ft = {
                rust = { "clippy" },
                javascript = { "eslint", "eslint_d" }, 
                python = { "flake8", "pylint", "ruff" },
                go = { "golangcilint", "revive" },
                html = { "htmlhint", "tidy" },
                css = { "stylelint" },
                lua = { "luacheck", "luac"},
            }

            local lint_augroup = vim.api.nvim_create_augroup('lint', {clear = true})

            vim.api.nvim_create_autocmd({'BufEnter', 'BufWritePost', 'InsertLeave'}, {
                group = lint_augroup,
                callback = function()
                    lint.try_lint()
                end,
            })

            vim.keymap.set('n', '<leader>ll', function()
                lint.try_lint()
            end)

        end
    },
}
